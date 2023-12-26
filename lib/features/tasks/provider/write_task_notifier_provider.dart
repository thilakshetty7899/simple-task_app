import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task_crud/core/models/task.dart';
import 'package:task_crud/core/repository/task_repository_provider.dart';
import 'package:task_crud/features/tasks/models/write_task_state.dart';
import 'package:task_crud/features/tasks/provider/tasks_provider.dart';
part 'write_task_notifier_provider.g.dart';

@riverpod
class WriteTaskNotifier extends _$WriteTaskNotifier {
  @override
  WriteTaskState build(Task? task) {
    return WriteTaskState(
        task: task ??
            Task(
              id: '',
              name: '',
              description: '',
              done: false,
              createdAt: DateTime.now(),
            ),
        loading: false);
  }

  void nameChanged(String v) {
    state = state.copyWith(
      task: state.task.copyWith(name: v),
    );
  }

  void descriptionChanged(String v) {
    state = state.copyWith(
      task: state.task.copyWith(description: v),
    );
  }

  void doneChanged(bool v) {
    state = state.copyWith(
      task: state.task.copyWith(done: v),
    );
  }

  TasksRepository get _repository => ref.read(tasksRepositoryProvider);
  Future<void> write() async {
    state = state.copyWith(loading: true);
    try {
      if (state.task.id.isEmpty) {
        await _repository.create(state.task);
      } else {
        await _repository.edit(state.task);
      }
      await ref.refresh(tasksProvider.future);
    } catch (e) {
      state = state.copyWith(loading: false);
      return Future.error(e);
    }
  }
}

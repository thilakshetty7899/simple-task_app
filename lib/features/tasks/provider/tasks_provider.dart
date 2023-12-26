import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task_crud/core/models/task.dart';
import 'package:task_crud/core/repository/task_repository_provider.dart';
part 'tasks_provider.g.dart';

@riverpod
FutureOr<List<Task>> tasks(TasksRef ref) {
  return ref.read(tasksRepositoryProvider).list();
}
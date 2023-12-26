import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_crud/core/models/task.dart';
import 'package:task_crud/core/providers/dio_provider.dart';

final tasksRepositoryProvider = Provider(TasksRepository.new);

class TasksRepository {
  final Ref _ref;

  TasksRepository(this._ref);
  Dio get _dio => _ref.read(dioProvider);

  Future<List<Task>> list() async {
    try {
      final res = await _dio.get('/tasks');
      final Iterable data = res.data;
      return data
          .map(
            (e) => Task.fromMap(e),
          )
          .toList();
    } on DioException catch (e) {
      return Future.error(
        e.response?.data ?? e.error,
      );
    }
  }

  Future<void> create(Task task) async {
    try {
      await _dio.post(
        "/tasks",
        data: task.toMap(),
      );
    } on DioException catch (e) {
      return Future.error(
        e.response?.data ?? e.error,
      );
    }
  }

  Future<void> edit(Task task) async {
    try {
      await _dio.put(
        "/tasks/${task.id}",
        data: task.toMap(),
      );
    } on DioException catch (e) {
      return Future.error(
        e.response?.data ?? e.error,
      );
    }
  }

  Future<void> delete(String id) async {
    try {
      await _dio.delete(
        "/tasks/$id",
      );
    } on DioException catch (e) {
      return Future.error(
        e.response?.data ?? e.error,
      );
    }
  }
}

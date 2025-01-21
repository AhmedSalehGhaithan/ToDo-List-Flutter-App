// lib/domain/repositories/task_repository.dart
import 'package:to_do_list/Domain/task.dart';


abstract class TaskRepository {
  Future<List<Task>> getAllTasks();
  Future<Task> getTaskById(int id);
  Future<int> addTask(Task task);
  Future<int> updateTask(Task task);
  Future<int> deleteTask(int id);
}

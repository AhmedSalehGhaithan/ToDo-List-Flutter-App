
import 'package:to_do_list/Data/task_local_data_source.dart';
import 'package:to_do_list/Data/task_model.dart';
import 'package:to_do_list/Domain/task.dart';
import 'package:to_do_list/Domain/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskLocalDataSource _localDataSource = TaskLocalDataSource();

  @override
  Future<List<Task>> getAllTasks() async {
    final taskModels = await _localDataSource.getAllTasks();
    return taskModels.map((taskModel) => Task(
      id: taskModel.id,
      title: taskModel.title,
      description: taskModel.description,
      isCompleted: taskModel.isCompleted,
      createdAt: taskModel.createdAt,
      updatedAt: taskModel.updatedAt,
    )).toList();
  }

  @override
  Future<Task> getTaskById(int id) async {
    final taskModel = await _localDataSource.getTaskById(id);
    return Task(
      id: taskModel.id,
      title: taskModel.title,
      description: taskModel.description,
      isCompleted: taskModel.isCompleted,
      createdAt: taskModel.createdAt,
      updatedAt: taskModel.updatedAt,
    );
  }

  @override
  Future<int> addTask(Task task) async {
    final taskModel = TaskModel(
      id: task.id,
      title: task.title,
      description: task.description,
      isCompleted: task.isCompleted,
      createdAt: task.createdAt,
      updatedAt: task.updatedAt,
    );
    return await _localDataSource.addTask(taskModel);
  }

  @override
  Future<int> updateTask(Task task) async {
    final taskModel = TaskModel(
      id: task.id,
      title: task.title,
      description: task.description,
      isCompleted: task.isCompleted,
      createdAt: task.createdAt,
      updatedAt: task.updatedAt,
    );
    return await _localDataSource.updateTask(taskModel);
  }

  @override
  Future<int> deleteTask(int id) async {
    return await _localDataSource.deleteTask(id);
  }
}

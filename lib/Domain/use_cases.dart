import 'package:to_do_list/Domain/task.dart';
import 'package:to_do_list/Domain/task_repository.dart';

class GetAllTasksUseCase {
  final TaskRepository taskRepository;

  GetAllTasksUseCase(this.taskRepository);

  Future<List<Task>> execute() {
    return taskRepository.getAllTasks();
  }
}

class AddTaskUseCase {
  final TaskRepository taskRepository;

  AddTaskUseCase(this.taskRepository);

  Future<int> execute(Task task) {
    return taskRepository.addTask(task);
  }
}

class UpdateTaskUseCase {
  final TaskRepository taskRepository;

  UpdateTaskUseCase(this.taskRepository);

  Future<int> execute(Task task) {
    return taskRepository.updateTask(task);
  }
}

class DeleteTaskUseCase {
  final TaskRepository taskRepository;

  DeleteTaskUseCase(this.taskRepository);

  Future<int> execute(int id) {
    return taskRepository.deleteTask(id);
  }
}

class TaskUseCases {
  final TaskRepository taskRepository;

  TaskUseCases(this.taskRepository);

  GetAllTasksUseCase getAllTasks() => GetAllTasksUseCase(taskRepository);
  AddTaskUseCase addTask() => AddTaskUseCase(taskRepository);
  UpdateTaskUseCase updateTask() => UpdateTaskUseCase(taskRepository);
  DeleteTaskUseCase deleteTask() => DeleteTaskUseCase(taskRepository);
}
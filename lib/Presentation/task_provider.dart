// lib/presentation/providers/task_provider.dart
import 'package:flutter/material.dart';
import 'package:to_do_list/Domain/task.dart';
import 'package:to_do_list/Domain/use_cases.dart';

class TaskProvider extends ChangeNotifier {
  final TaskUseCases taskUseCases;

  TaskProvider(this.taskUseCases);

  List<Task> _tasks = [];
  List<Task> get tasks => _tasks;

  Future<void> fetchAllTasks() async {
    _tasks = await taskUseCases.getAllTasks().execute();
    notifyListeners();
  }

  Future<void> addTask(Task task) async {
    await taskUseCases.addTask().execute(task);
    await fetchAllTasks();
  }

  Future<void> updateTask(Task task) async {
    await taskUseCases.updateTask().execute(task);
    await fetchAllTasks();
  }

  Future<void> deleteTask(int id) async {
    await taskUseCases.deleteTask().execute(id);
    await fetchAllTasks();
  }
}

// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/Data/task_repository_impl.dart';
import 'package:to_do_list/Domain/use_cases.dart';
import 'package:to_do_list/Presentation/list_screen.dart';
import 'package:to_do_list/Presentation/task_provider.dart';

void main() {
  final taskRepository = TaskRepositoryImpl();
  final taskUseCases = TaskUseCases(taskRepository);

  runApp(
    ChangeNotifierProvider(
      create: (_) => TaskProvider(taskUseCases),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TaskListScreen(),
    );
  }
}

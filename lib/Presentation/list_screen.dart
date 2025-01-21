// lib/presentation/screens/task_list_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/Presentation/task_detail_screen.dart';
import 'package:to_do_list/Presentation/task_provider.dart';
import 'package:to_do_list/Presentation/task_tile.dart';

class TaskListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To-Do List"),
        centerTitle: true,
      ),
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, _) {
          return taskProvider.tasks.isEmpty
              ? Center(child: Text("No tasks yet!"))
              : ListView.builder(
                  itemCount: taskProvider.tasks.length,
                  itemBuilder: (context, index) {
                    final task = taskProvider.tasks[index];
                    return TaskTile(task: task);
                  },
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to Add Task screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => TaskDetailScreen(task: null),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

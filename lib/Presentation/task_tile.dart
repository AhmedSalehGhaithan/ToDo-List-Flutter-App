// lib/presentation/widgets/task_tile.dart
import 'package:flutter/material.dart';
import 'package:to_do_list/Domain/task.dart';
import 'package:to_do_list/Presentation/task_detail_screen.dart';
import 'package:to_do_list/Presentation/task_provider.dart';
import 'package:provider/provider.dart';

class TaskTile extends StatelessWidget {
  final Task task;

  TaskTile({required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 4,
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: Icon(
          task.isCompleted ? Icons.check_circle : Icons.circle_outlined,
          color: task.isCompleted ? Colors.green : Colors.grey,
          size: 30,
        ),
        title: Text(
          task.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            decoration: task.isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text(
          task.description,
          style: TextStyle(fontSize: 14),
        ),
        onTap: () {
          // Navigate to Edit Task screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => TaskDetailScreen(task: task),
            ),
          );
        },
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            // Delete the task
            Provider.of<TaskProvider>(context, listen: false)
                .deleteTask(task.id);
          },
        ),
      ),
    );
  }
}

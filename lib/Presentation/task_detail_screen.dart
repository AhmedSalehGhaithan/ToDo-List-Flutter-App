// lib/presentation/screens/task_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:to_do_list/Domain/task.dart';
import 'package:to_do_list/Presentation/task_provider.dart';
import 'package:provider/provider.dart';


class TaskDetailScreen extends StatefulWidget {
  final Task? task;

  TaskDetailScreen({this.task});

  @override
  _TaskDetailScreenState createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(
      text: widget.task?.title ?? '',
    );
    _descriptionController = TextEditingController(
      text: widget.task?.description ?? '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.task == null ? 'Add Task' : 'Edit Task'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final task = Task(
                      id: widget.task?.id ?? 0,
                      title: _titleController.text,
                      description: _descriptionController.text,
                      isCompleted: false,
                      createdAt: DateTime.now(),
                      updatedAt: DateTime.now(),
                    );
                    if (widget.task == null) {
                      // Add new task
                      Provider.of<TaskProvider>(context, listen: false)
                          .addTask(task);
                    } else {
                      // Update existing task
                      Provider.of<TaskProvider>(context, listen: false)
                          .updateTask(task);
                    }
                    Navigator.pop(context);
                  }
                },
                child: Text(widget.task == null ? 'Add Task' : 'Update Task'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

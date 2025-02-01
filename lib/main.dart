import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager with AI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TaskInputScreen(),
    );
  }
  // lll
}

class TaskInputScreen extends StatefulWidget {
  @override
  _TaskInputScreenState createState() => _TaskInputScreenState();
}

class _TaskInputScreenState extends State<TaskInputScreen> {
  final _taskController = TextEditingController();
  final _priorityController = TextEditingController();
  String? _taskName;
  String? _priority;

  void _submitTask() {
    // Here, you can store the task or send it to a model
    setState(() {
      _taskName = _taskController.text;
      _priority = _priorityController.text;
    });

    // Call the AI classification/filtering function here
    // (E.g., based on menstrual cycle phase, energy levels, etc.)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Task Input")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _taskController,
              decoration: InputDecoration(labelText: 'Enter Task'),
            ),
            TextField(
              controller: _priorityController,
              decoration: InputDecoration(
                  labelText: 'Enter Priority (Low/Medium/High)'),
            ),
            ElevatedButton(
              onPressed: _submitTask,
              child: Text('Add Task'),
            ),
            if (_taskName != null && _priority != null)
              Text('Task: $_taskName, Priority: $_priority'),
          ],
        ),
      ),
    );
  }
}

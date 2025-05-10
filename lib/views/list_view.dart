import 'package:flutter/material.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Tarea 1'),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Tarea 2'),
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text('Tarea 3'),
        ),
      ],
    );
  }
}
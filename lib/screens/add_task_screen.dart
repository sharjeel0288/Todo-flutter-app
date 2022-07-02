// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_data.dart';

// ignore: must_be_immutable
class AddTaskScreen extends StatelessWidget {
  String newTaskTitle = '';
  PanelController panelController;
  // ignore: use_key_in_widget_constructors
  AddTaskScreen({required this.panelController});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {
                newTaskTitle = value;
              },
            ),
            FlatButton(
              onPressed: () {
                if (newTaskTitle != '') {
                  Provider.of<TaskData>(context, listen: false)
                      .addTask(newTaskTitle);
                  // Navigator.pop(context);
                  panelController.close();
                }
              },
              color: Colors.lightBlueAccent,
              child: const Text(
                'ADD',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ));
  }
}

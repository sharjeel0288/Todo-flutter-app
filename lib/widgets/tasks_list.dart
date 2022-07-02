import 'package:flutter/material.dart';
import 'package:todo_app/widgets/task_tile.dart';
import 'package:todo_app/models/task_data.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class TasksList extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (BuildContext context, taskData, Widget? child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              isChecked: taskData.tasks[index].isDone,
              taskTitle: taskData.tasks[index].name,
              checkboxCallback: (bool checkBoxState) {
                taskData.updateTask(taskData.tasks[index]);
              },
              longPressCallback: () {
                taskData.deleteTask(taskData.tasks[index]);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}

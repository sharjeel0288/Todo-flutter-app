// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:todo_app/screens/add_task_screen.dart';
import 'package:todo_app/widgets/tasks_list.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_data.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey();

// ignore: must_be_immutable, use_key_in_widget_constructors
class TasksScreen extends StatelessWidget {
  PanelController panelController = PanelController();
  bool isFocus = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        panelController.close();
      },
      child: Scaffold(
        key: _key,
        drawer: Drawer(
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  const CircleAvatar(
                    backgroundImage: AssetImage('images/profile.jpg'),
                    radius: 100,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    'Sharjeel Ahmed',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w900,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              color: Colors.lightBlueAccent,
              padding: const EdgeInsets.only(
                  top: 60.0, left: 30, right: 30, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30.0,
                    child: FlatButton(
                      child: const Icon(
                        Icons.list,
                        size: 30.0,
                        color: Colors.lightBlueAccent,
                      ),
                      onPressed: () {
                        _key.currentState!.openDrawer();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    'Todoey',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 50.0,
                    ),
                  ),
                  Text(
                    '${Provider.of<TaskData>(context).taskCount} Tasks',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: TasksList(),
              ),
            ),
            SlidingUpPanel(
              controller: panelController,
              // ignore: prefer_const_literals_to_create_immutables
              boxShadow: [
                const BoxShadow(
                  blurRadius: 3,
                  blurStyle: BlurStyle.normal,
                )
              ],
              onPanelClosed: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              minHeight: 40.0,
              maxHeight: 200,
              panel: Center(
                child: AddTaskScreen(
                  panelController: panelController,
                ),
              ),
              collapsed: Container(
                decoration: const BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'swap up to add TO-DO',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            )
          ],
        ),
      ),
    );
  }
}

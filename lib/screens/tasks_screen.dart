import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/task_data.dart';
import '../widgets/tasks_list.dart';
import 'add_task_screen.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Inventory List"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => AddTaskScreen());
        },
        backgroundColor: Colors.redAccent,
        child: const Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 300,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: TasksList(),
          )),
        ],
      ),
    );
  }
}

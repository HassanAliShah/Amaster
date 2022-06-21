import 'package:flutter/material.dart';
import 'package:gmaster/widgets/tasks_tile.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../model/task_data.dart';
import '../screens/update_task_screen.dart';

class TasksList extends StatefulWidget {
  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: ((context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.task[index];
            return TaskTile(
              metric: taskData.task[index].metric,
              quantity: taskData.task[index].quantity,
              taskTitle: taskData.task[index].name,
              longPressCallBack: () {
                Alert(
                  context: context,
                  type: AlertType.error,
                  title: "Ninja",
                  desc: "Are you Sure you want to delete item?",
                  buttons: [
                    DialogButton(
                      child: Text(
                        "DELETE",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        taskData.deleteTask(task);
                        Navigator.pop(context);
                      },
                      width: 120,
                    )
                  ],
                ).show();
              },
              ontapButon: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => UpdateTaskScreen(
                          quantity: taskData.task[index].quantity,
                          task: task,
                          index: index,
                          updatedDataOfTask: (quantity) {
                            taskData.updateTask(task, quantity, index);
                          },
                        ));
              },
            );
          },
          itemCount: taskData.countTask,
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gmaster/widgets/shopping_tasks_tile.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../model/task_data.dart';
import '../screens/update_task_screen.dart';

class ShoppingTaskList extends StatefulWidget {
  const ShoppingTaskList({Key? key}) : super(key: key);

  @override
  State<ShoppingTaskList> createState() => _ShoppingTaskListState();
}

class _ShoppingTaskListState extends State<ShoppingTaskList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: ((context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.shoppingtasks[index];
            return ShoppingTaskTile(
              metric: task.metric,
              quantity: task.quantity,
              taskTitle: task.name,
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
                        taskData.deleteShoppingTask(task);
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
                          quantity: task.quantity,
                          task: task,
                          index: index,
                          updatedDataOfTask: (quantity) {
                            taskData.updateShoppingTask(task, quantity, index);
                          },
                        ));
              },
            );
          },
          itemCount: taskData.shoppinglist,
        );
      }),
    );
  }
}

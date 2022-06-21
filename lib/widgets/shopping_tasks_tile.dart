import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShoppingTaskTile extends StatelessWidget {
  late final int quantity;
  late final String taskTitle;
  late final String metric;
  final void Function() longPressCallBack;
  final void Function() ontapButon;
  // final Task task;

  ShoppingTaskTile(
      {required this.quantity,
      required this.taskTitle,
      required this.metric,
      required this.longPressCallBack,
      required this.ontapButon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onLongPress: longPressCallBack,
          title: Text(
            taskTitle,
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("$quantity"),
              SizedBox(
                width: 5,
              ),
              Text(metric),
              SizedBox(
                width: 5,
              ),
              IconButton(onPressed: ontapButon, icon: Icon(Icons.edit))
            ],
          ),
        ),
        Divider()
      ],
    );
  }
}

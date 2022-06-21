import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gmaster/user/quantitybutton.dart';
import 'package:provider/provider.dart';

import '../model/task_data.dart';
import '../model/tasks.dart';

class UpdateTaskScreen extends StatefulWidget {
  late final int quantity;
  final Task task;
  final int index;
  final Future<int>? Function(int) updatedDataOfTask;
  UpdateTaskScreen(
      {required this.quantity,
      required this.task,
      required this.index,
      required this.updatedDataOfTask});

  @override
  State<UpdateTaskScreen> createState() => _UpdateTaskScreenState();
}

class _UpdateTaskScreenState extends State<UpdateTaskScreen> {
  int updatedQuantity = 0;
  int quantity = 0;
  @override
  Widget build(BuildContext context) {
    quantity = widget.quantity;

    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      height: 300,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Text(
            "Update Quantity",
            style: TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: QuantityButton(
                initialQuantity: quantity,
                onQuantityChange: (data) {
                  setState(() {
                    updatedQuantity = data;
                  });
                }),
          ),
          TextButton(
            onPressed: () {
              widget.updatedDataOfTask(updatedQuantity);
              Navigator.pop(context);
            },
            child: Text(
              'Update',
              style: TextStyle(color: Colors.white),
            ),
            style: TextButton.styleFrom(
                backgroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
          )
        ],
      ),
    );
  }
}

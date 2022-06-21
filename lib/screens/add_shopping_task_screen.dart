import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/task_data.dart';

class AddShoppingTaskScreen extends StatefulWidget {
  const AddShoppingTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddShoppingTaskScreen> createState() => _AddShoppingTaskScreenState();
}

class _AddShoppingTaskScreenState extends State<AddShoppingTaskScreen> {
  List metricList = <String>[
    'Kg',
    'Packet',
    'Dozen',
    'Jar',
    'None',
    'Box',
    'ml',
    'Bottles'
  ];
  List quantityList = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  String newTaskTitle = '';

  String metric = 'kg';
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      color: Color(0xff757575),
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add Item',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, color: Colors.redAccent),
              ),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  newTaskTitle = value;
                  print(newTaskTitle);
                },
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: DropdownButtonFormField(
                    itemHeight: 50,
                    decoration: InputDecoration(
                      labelText: "Metric",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    dropdownColor: Colors.white,
                    value: metricList.first,
                    onChanged: (value) {
                      setState(() {
                        metric = value.toString();
                      });
                    },
                    items: metricList
                        .map(
                          (map) => DropdownMenuItem(
                            child: Text(map),
                            value: map,
                          ),
                        )
                        .toList()),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: DropdownButtonFormField(
                    itemHeight: 50,
                    decoration: InputDecoration(
                      labelText: "Quantity",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    dropdownColor: Colors.white,
                    value: quantityList.first,
                    onChanged: (value) {
                      setState(() {
                        quantity = int.parse(value.toString());
                      });
                    },
                    items: quantityList
                        .map(
                          (map) => DropdownMenuItem(
                            child: Text("$map"),
                            value: map,
                          ),
                        )
                        .toList()),
              ),
              TextButton(
                  onPressed: () {
                    Provider.of<TaskData>(context, listen: false)
                        .addShoppingTask(newTaskTitle, quantity, metric);
                    Navigator.pop(context);
                  },
                  style:
                      TextButton.styleFrom(backgroundColor: Colors.redAccent),
                  child: Text(
                    "Add",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

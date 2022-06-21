import 'package:flutter/material.dart';

import '../global.dart';
import '../screens/add_shopping_task_screen.dart';
import '../widgets/shopping_tasks_list.dart';
import 'package:gmaster/model/database_model.dart';

class ShoppingList extends StatefulWidget {
  const ShoppingList({Key? key}) : super(key: key);

  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Shopping List"),
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => AddShoppingTaskScreen());
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
                child: ShoppingTaskList()),
          ),
        ],
      ),
    );
  }
}

import 'package:firebase_database/firebase_database.dart';
import 'package:gmaster/global.dart';
import 'package:gmaster/model/tasks.dart';
import 'package:flutter/foundation.dart';
import 'dart:collection';

import 'package:gmaster/model/user_model.dart';

class TaskData extends ChangeNotifier {
  DatabaseReference usersRef = FirebaseDatabase.instance
      .ref()
      .child("users")
      .child(userModelcurrentInfo!.id.toString());

  DatabaseReference users = FirebaseDatabase.instance.ref().child("users");

  get task {
    return tasks;
  }

  get user {
    return userList;
  }

  get shoppingtasks {
    return shoppingTask;
  }

  get familyuser {
    return familyList;
  }

  int get countTask {
    return tasks.length;
  }

  int get countUser {
    return userList.length;
  }

  int get countFamily {
    return familyList.length;
  }

  int get shoppinglist {
    return shoppingTask.length;
  }

  void addTask(String newTaskTitle, int quantity, String metric) {
    final task = Task(name: newTaskTitle, metric: metric, quantity: quantity);

    Map itemMap = {"quantity": "$quantity", "Metric": metric};
    usersRef.child("InventoryList").child(newTaskTitle).set(itemMap);
    tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task, int quantity, int index) {
    tasks[index] =
        Task(name: task.name, quantity: quantity, metric: task.metric);
    usersRef
        .child("InventoryList")
        .child(task.name)
        .update({"quantity": "$quantity"});
    notifyListeners();
  }

  Future<void> deleteTask(Task task) async {
    usersRef
        .child("ShoppingList")
        .child(task.name)
        .set({"quantity": "${task.quantity}", "Metric": task.metric});
    var family = await usersRef.child("FamilyMember").get();
    Map mfamily = family.value as Map;
    mfamily.forEach((key, value) {
      print(key);
      FirebaseDatabase.instance
          .ref()
          .child("users")
          .child(key)
          .child("ShoppingList")
          .child(task.name)
          .set({"quantity": "${task.quantity}", "Metric": task.metric});
    });

    shoppingTask.add(task);
    tasks.remove(task);
    usersRef.child("InventoryList").child(task.name).remove();
    notifyListeners();
  }

  void deleteShoppingTask(Task task) {
    shoppingTask.remove(task);
    usersRef.child("ShoppingList").child(task.name).remove();
    notifyListeners();
  }

  void addShoppingTask(String newTaskTitle, int quantity, String metric) {
    final task = Task(name: newTaskTitle, metric: metric, quantity: quantity);

    Map itemMap = {"quantity": "$quantity", "Metric": metric};
    usersRef.child("ShoppingList").child(newTaskTitle).set(itemMap);
    shoppingTask.add(task);
    notifyListeners();
  }

  void updateShoppingTask(Task task, int quantity, int index) {
    shoppingTask[index] =
        Task(name: task.name, quantity: quantity, metric: task.metric);
    usersRef
        .child("ShoppingList")
        .child(task.name)
        .update({"quantity": "$quantity"});
    notifyListeners();
  }

  void deleteFamilyMember(UserModel user) {
    familyList.remove(user);
    notifyListeners();
  }

  Future<void> addFamilyMember(
      String firstname, String lastname, String email, String uid) async {
    final user = UserModel(
        email: email, firstName: firstname, lastName: lastname, id: uid);
    Map<String, dynamic> userMap = {
      uid: true,
      // "firstname": firstname,
      // "lastname": lastname,
      // "email": email,
    };

    usersRef.child("FamilyMember").update(userMap);
    DatabaseReference Ref =
        FirebaseDatabase.instance.ref().child("users").child(uid);
    Ref.child("FamilyMember")
        .update({userModelcurrentInfo!.id.toString(): true});
    familyList.add(user);
    notifyListeners();
  }
}

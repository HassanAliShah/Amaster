import 'package:firebase_database/firebase_database.dart';
import 'package:gmaster/model/tasks.dart';
import 'package:gmaster/model/user_model.dart';

import '../global.dart';

class DatabaseModel {
  DatabaseReference usersRef = FirebaseDatabase.instance
      .ref()
      .child("users")
      .child(userModelcurrentInfo!.id.toString());

  DatabaseReference memberRefrence =
      FirebaseDatabase.instance.ref().child("users");

  UserInventryList() async {
    var userData = await usersRef.child("InventoryList").get();
    if (userData.exists) {
      Map data = userData.value as Map;
      data.forEach((key, value) {
        final task = Task(
            name: key,
            quantity: int.parse(value['quantity']),
            metric: value['Metric']);
        tasks.add(task);
      });
    }
  }

  UserShoppingList() async {
    var familylist = await usersRef.child("FamilyMember").get();
    if (familylist.exists) {
      Map familyMap = familylist.value as Map;
      familyMap.forEach((key, value) async {
        DataSnapshot memberData = await FirebaseDatabase.instance
            .ref()
            .child("users")
            .child(key)
            .child("ShoppingList")
            .get() as DataSnapshot;
        if (memberData.exists) {
          Map mdata = memberData.value as Map;
          mdata.forEach((key, value) {
            final task = Task(
                name: key,
                quantity: int.parse(value['quantity']),
                metric: value['Metric']);
            shoppingTask.add(task);
          });
        }
      });
    }
    var userData = await usersRef.child("ShoppingList").get();
    if (userData.exists) {
      Map data = userData.value as Map;
      data.forEach((key, value) {
        print(key);
        final task = Task(
            name: key,
            quantity: int.parse(value['quantity']),
            metric: value['Metric']);
        shoppingTask.add(task);
      });
    }
  }

  UserList() async {
    DataSnapshot users =
        await FirebaseDatabase.instance.ref().child("users").get();
    Map usersMap = users.value as Map;
    usersMap.forEach((key, value) {
      if (!(key.toString() == userModelcurrentInfo!.id.toString())) {
        final user = UserModel(
            email: value['email'],
            firstName: value['firstname'],
            lastName: value['lastname'],
            id: value['id']);
        userList.add(user);
      }
    });
  }

  FamilyList() async {
    print(userModelcurrentInfo!.uid);
    DataSnapshot users = await FirebaseDatabase.instance
        .ref()
        .child("users")
        .child(userModelcurrentInfo!.uid)
        .child("FamilyMember")
        .get();
    if (users.exists) {
      print("Family List Exists");

      Map usersMap = users.value as Map;
      usersMap.forEach((key, value) async {
        print(key);
        var member = await memberRefrence.child(key).get();
        Map memberMap = member.value as Map;
        final user = UserModel(
            email: memberMap['email'],
            firstName: memberMap['firstname'],
            lastName: memberMap['lastname'],
            id: memberMap['id']);
        familyList.add(user);
      });
    }
    print("family member done");
  }
}

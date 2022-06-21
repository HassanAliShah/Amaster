import 'package:flutter/material.dart';
import 'package:gmaster/widgets/user_tile.dart';
import 'package:provider/provider.dart';

import '../model/task_data.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: ((context, userData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final user = userData.user[index];
            return UserTile(
                firstName: user.firstname,
                lastName: user.lastName,
                email: user.email,
                onTap: () => userData.addFamilyMember(
                    user.firstname, user.lastName, user.email, user.uid));
          },
          itemCount: userData.countUser,
        );
      }),
    );
  }
}

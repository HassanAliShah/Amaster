import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String email;
  final void Function() onTap;

  UserTile(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          title: Row(
            children: [
              Text(
                firstName,
              ),
              Text(lastName)
            ],
          ),
          subtitle: Text(email),
        ),
        Divider()
      ],
    );
    ;
  }
}

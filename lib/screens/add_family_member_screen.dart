import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gmaster/global.dart';

import '../widgets/user_list.dart';

class AddFamilyMemberScreen extends StatefulWidget {
  const AddFamilyMemberScreen({Key? key}) : super(key: key);

  @override
  State<AddFamilyMemberScreen> createState() => _AddFamilyMemberScreenState();
}

class _AddFamilyMemberScreenState extends State<AddFamilyMemberScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      color: Color(0xff757575),
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height / 1.5,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: UserList(),
        ),
      ),
    );
  }
}

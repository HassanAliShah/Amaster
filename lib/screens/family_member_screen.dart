import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gmaster/widgets/family_list.dart';
import 'add_family_member_screen.dart';

class FamilyMemberScreen extends StatefulWidget {
  const FamilyMemberScreen({Key? key}) : super(key: key);

  @override
  State<FamilyMemberScreen> createState() => _FamilyMemberScreenState();
}

class _FamilyMemberScreenState extends State<FamilyMemberScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Family Member"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => AddFamilyMemberScreen());
          },
          backgroundColor: Colors.redAccent,
          child: const Icon(Icons.add),
        ),
        body: FamilyListScreen());
  }
}

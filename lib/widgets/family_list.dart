import 'package:flutter/material.dart';
import 'package:gmaster/widgets/user_tile.dart';
import 'package:provider/provider.dart';

import '../model/task_data.dart';

class FamilyListScreen extends StatefulWidget {
  const FamilyListScreen({Key? key}) : super(key: key);

  @override
  State<FamilyListScreen> createState() => _FamilyListScreenState();
}

class _FamilyListScreenState extends State<FamilyListScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: ((context, familyData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final member = familyData.familyuser[index];
            return UserTile(
                firstName: familyData.familyuser[index].firstname,
                lastName: familyData.familyuser[index].lastName,
                email: familyData.familyuser[index].email,
                onTap: () => familyData.deleteFamilyMember(member));
          },
          itemCount: familyData.countFamily,
        );
      }),
    );
  }
}

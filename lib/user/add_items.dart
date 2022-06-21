import 'package:flutter/material.dart';
import 'package:gmaster/user/quantitybutton.dart';
class additems extends StatefulWidget {
  const additems({Key? key}) : super(key: key);

  @override
  State<additems> createState() => _additemsState();
}

class _additemsState extends State<additems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color:Color(0xff757575),
      child: Container(decoration: BoxDecoration(color: Colors.white,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      )),

child: Column(
  children: [
    Text('Add Item',style: TextStyle(fontSize: 30.0,color: Colors.redAccent),
    ),

    SizedBox(
      width: 200,
      child: TextFormField(

        autofocus: true,
        textAlign: TextAlign.center,




        ),
    ),

    Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(onPressed:(){}, child: Text('Add Item')),
    ),


  ],
),
      ),

    );
  }
}

    
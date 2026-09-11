import 'package:flutter/material.dart';
import 'package:sqflate_demo/db/model.dart';
import 'package:sqflate_demo/db/sqflate.dart';

class AddScreen extends StatelessWidget {
  AddScreen({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        spacing: 20,
        children: [
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(
                label: Text('name'), border: OutlineInputBorder()),
          ),
          TextFormField(
            controller: ageController,
            decoration: InputDecoration(
                label: Text('age'), border: OutlineInputBorder()),
          ),
          FloatingActionButton(
            onPressed: () {
              if (nameController.text.isNotEmpty &&
                  ageController.text.isNotEmpty) {
                String name = nameController.text;
                String age = ageController.text;
                student.value.add(StudentModel(
                    id: DateTime.now().millisecond, name: name, age: age));
                student.notifyListeners();
              }
              Navigator.pop(context);
            },
            child: Text('submit'.toUpperCase()),
          )
        ],
      )),
    );
  }
}

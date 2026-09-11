import 'package:flutter/material.dart';
import 'package:sqflate_demo/add_screen.dart';
import 'package:sqflate_demo/db/sqflate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(title: Text('student Details'.toUpperCase())),
      body: 
           ValueListenableBuilder(valueListenable: student,
            builder: (context, value, child) =>value.isEmpty
          ? Center(
              child: Text('no data avilable'),
            ):ListView.builder(
                itemCount: student.value.length,
                itemBuilder: (context, index) {
                  final data = student.value[index];
                  return ListTile(
                    title: Text(data.name),
                    subtitle: Text(data.age),
                  );
                }),
          ) ,
            
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

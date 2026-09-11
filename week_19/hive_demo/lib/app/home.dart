import 'package:flutter/material.dart';
import 'package:hive_demo/app/add/add.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title:Text('User List'.toUpperCase()),
    ),floatingActionButton: FloatingActionButton(onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>AddScreen()));
    }, child: Icon(Icons.add)),floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,);
  }
}

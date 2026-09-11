import 'package:flutter/foundation.dart';
import 'package:sqflate_demo/db/model.dart';
import 'package:sqflite/sqflite.dart';

ValueNotifier<List<StudentModel>> student = ValueNotifier([]);

class Db {
  late Database db;
  void dbInt() async {
   
  }

  void dbInsert({required String name, required String age}) async {
   
  }

  void dbGetAll() async {
   
  }

  void dbGetSingle(int id) async {
  
  }

  void dbDlete(int id) async {
   
  }

  void dbUpdate(String name, String age, int id) async {
 
  }

  void dbCreateNewColum() async {
    
  }

  void dbRename() async {
    
  }
}

import 'package:flutter/material.dart';
import 'package:hive_demo/model/model.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<List<UserModel>> userCollection = ValueNotifier([]);

class HiveData {
  dbInit() async {
    await Hive.initFlutter();
    
    if (Hive.isAdapterRegistered(UserModelAdapter().typeId)) {
      Hive.registerAdapter(UserModelAdapter());
    }
  }

  getDb() async {
    final db = await Hive.openBox<UserModel>('user');
    userCollection.value.addAll(db.values);
    userCollection.notifyListeners();
  }

  addDb(UserModel model) async {
    final db = await Hive.openBox<UserModel>('user');
    db.put(model.id, model);
    userCollection.value.add(model);
    userCollection.notifyListeners();
  }

  updateDb(UserModel model) async {
    final db = await Hive.openBox<UserModel>('user');
    db.put(model.id, model);
    userCollection.value.removeWhere((d) => d.id == model.id);
    userCollection.value.add(model);
    userCollection.notifyListeners();
  }

  delete(String id) async {
    final db = await Hive.openBox<UserModel>('user');
    db.delete(id);
    userCollection.value.removeWhere((d) => d.id == id);
    userCollection.notifyListeners();
  }

  search(String quary) async {
    final db = await Hive.openBox<UserModel>('user');
    String value = quary.toLowerCase().trim();
    userCollection.value.clear();
    userCollection.value = db.values.where((data) {
      return data.name.toLowerCase().contains(value) ||
          data.email.toLowerCase().contains(value);
    }).toList();
    userCollection.notifyListeners();
  }
}

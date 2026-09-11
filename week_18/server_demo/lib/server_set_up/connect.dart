import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';

final mongoUrl = 'mongodb+srv://test:<db_password>@cluster0.pu8yodn.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0';
final collectionName = 'test';

class MongoDb {
  static connect() async {
    var db = await Db.create(mongoUrl);
    await db.open();
    inspect(db);
    var collections = db.collection(collectionName);
  }
}

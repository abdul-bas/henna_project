import 'package:hive/hive.dart';
part 'model.g.dart';

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String password;
  UserModel(
      {this.id,
      required this.email,
      required this.name,
      required this.password});
}

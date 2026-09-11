class StudentModel {
  int id;
  String name;
  String age;
  StudentModel({required this.id, required this.name, required this.age});
  factory StudentModel.formMap(Map<String, dynamic> map) {
   return StudentModel(id: map['id'], name: map['name'], age: map['age']);
  }
}

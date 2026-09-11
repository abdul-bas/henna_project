class StudentModel {
  int? id;

  String name;

  String rollNumber;

  String className;

  String phoneNumber;

  StudentModel({
     this.id,
    required this.name,
    required this.rollNumber,
    required this.className,
    required this.phoneNumber,
  });
  factory StudentModel.fromJson(Map<String, dynamic> json) {
  return StudentModel(id: json['id'],
    name: json['name']??'basith',
    rollNumber: json['rollNumber']??'45123',
    className: json['className']??'10D',
    phoneNumber: json['phoneNumber']??'8590371113',
  );
}
}

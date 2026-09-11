import 'package:todo_app/model/model.dart';
  List<StudentModel> filteredStudents=[];
class ApiState {
  List<StudentModel>? data;
 

  ApiState({this.data,});
}

class ApiError extends ApiState {
  final String error;
  ApiError(this.error) : super(data: []);
}





class ApiStatus extends ApiState {
  final String status;

  ApiStatus(this.status) : super(data: []) {
    print(status);
  }
}


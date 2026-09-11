import 'package:todo_app/model/model.dart';
import 'package:todo_app/state_management/api_service/api_state.dart';

abstract class ApiEvent {}

class ApiGet extends ApiEvent {}

class ApiPost extends ApiEvent {
  StudentModel value;
  ApiPost({required this.value});
}

class ApiPut extends ApiEvent {
  StudentModel value;
  ApiPut({required this.value});
}

class ApiDelete extends ApiEvent {
  int id;
  ApiDelete({required this.id});
}

class Search extends ApiEvent {
  String value;
  Search({ required this.value});
}

import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:todo_app/api_services/api_services.dart';
import 'package:todo_app/model/model.dart';
import 'package:todo_app/state_management/api_service/api_event.dart';
import 'package:todo_app/state_management/api_service/api_initial.dart';
import 'package:todo_app/state_management/api_service/api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  ApiBloc() : super(ApiInitial()) {
    on<ApiPost>(onPostData);
    on<ApiGet>(onGetData);
    on<ApiPut>(onPutData);
    on<ApiDelete>(onDeleteData);
    on<Search>(onSearch);
  }
  Future<void> onPostData(
    ApiPost event,
    Emitter<ApiState> emit,
  ) async {
    final StudentModel value = event.value;
    final endPoint = 'items/';
    final uri = '$baseUrl$endPoint';
    final url = Uri.parse(uri);
    try {
      final Response = await http.post(url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            "name": value.name,
            "rollNumber": value.rollNumber,
            "className": value.className,
            "phoneNumber": value.phoneNumber,
            "imageUrl": "https://example.com/images/alex.jpg",
            "description": "First student entry.",
            "createdAt": "2023-10-27T10:30:00.123Z",
            "updatedAt": "2023-10-27T10:30:00.123Z"
          }));
      if (Response.statusCode == 200 || Response.statusCode == 201) {
        emit(ApiStatus('success.........................................'));
      } else {
        emit(ApiStatus(
            'not Successs....................................................${Response.statusCode}, ${Response.body}'));
      }
    } catch (e) {
      emit(ApiError('error$e'));
    }
  }

  Future<List<StudentModel>> onGetData(
      ApiGet event, Emitter<ApiState> emit) async {
    final endPoint = 'items';
    final uri = '$baseUrl$endPoint';
    final url = Uri.parse(uri);
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
      
        List<dynamic> jsonList = jsonDecode(response.body);

        List<StudentModel> student =
            jsonList.map((map) => StudentModel.fromJson(map)).toList();

        emit(ApiState(data: student));
        return student;
      } else {
        print('not success=========================');
        emit(ApiState(data: []));
      }
    } catch (e) {
      emit(ApiError('error$e'));
    }
    return [];
  }

  Future<void> onPutData(ApiPut event, Emitter<ApiState> emit) async {
    StudentModel value = event.value;
    final endPoint = 'items/${value.id}';
    final uri = '$baseUrl$endPoint';
    final url = Uri.parse(uri);
    try {
      final response = await http.put(url,
          headers: {'Content-Type': 'application/json',
                           },
          
          body: jsonEncode({
            "id": value.id,
            "name": value.name,
            "rollNumber": value.rollNumber,
            "className": value.className,
            "phoneNumber": value.phoneNumber,
            "imageUrl": "https://example.com/images/alex.jpg",
            "description": "First student entry.",
            "createdAt": "2023-10-27T10:30:00.123Z",
            "updatedAt": "2023-10-27T10:30:00.123Z"
          }));
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('success');
      } else {
        print('faild');
      }
    } catch (e) {
      emit(ApiError('error'));
    }
  }

  Future<void> onDeleteData(ApiDelete event, Emitter<ApiState> emit) async {
    int id = event.id;
    final endPoint = 'items/$id';
    final uri = '$baseUrl$endPoint';
    final url = Uri.parse(uri);
    try {
      final response = await http.delete(url);
      if (response.statusCode == 200 || response.statusCode == 204) {
        print('Deleted successfully');
       
        add(ApiGet());
      } else {
        print('delete is faild');
      }
    } catch (e) {
      emit(ApiError('$e'));
    }
  }

  Future<void> onSearch(Search event, Emitter<ApiState> emit) async {
    String query = event.value.toLowerCase();
    if (state.data == null || state.data!.isEmpty) {
      print('No data to search');
      return;
    }
    filteredStudents.clear();
    List<StudentModel> filtered = state.data!
        .where((s) =>
            s.name.toLowerCase().contains(query) ||
            s.phoneNumber.toLowerCase().contains(query) ||
            s.rollNumber.toLowerCase().contains(query) ||
            s.className.toLowerCase().contains(query))
        .toList();

    filteredStudents = filtered;
    emit(ApiState(data: state.data));
    print('Succesfull fetched data');
  }
}

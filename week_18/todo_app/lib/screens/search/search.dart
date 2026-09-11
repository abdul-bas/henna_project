import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/model/model.dart';
import 'package:todo_app/state_management/api_service/api_bloc.dart';
import 'package:todo_app/state_management/api_service/api_event.dart';
import 'package:todo_app/state_management/api_service/api_state.dart';
import 'package:todo_app/widget/text_form_field.dart';
import 'package:todo_app/widget/text_overflow.dart';
import 'dart:async';

// ignore: must_be_immutable
class SearchScreen extends StatefulWidget {
  SearchScreen({super.key, required this.student});
  final List<StudentModel> student;
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController controller = TextEditingController();
  
  Timer? _debounce;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filteredStudents =widget.student;
  }

  @override
  Widget build(BuildContext context) {
    void onSearchChanged(String query) {
      if (_debounce?.isActive ?? false) _debounce!.cancel();
      _debounce = Timer(const Duration(milliseconds: 400), () {
        context.read<ApiBloc>().add(Search(value: query));
      });
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            TextFormWidget(
              text: 'Search',
              controller: controller,
              redius: 20,
              onChangeConform: onSearchChanged,
              sufixWidget: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  controller.clear();
                  context.read<ApiBloc>().add(Search(value: ''));
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<ApiBloc, ApiState>(builder: (context, state) {
                if (controller.text.isEmpty && state.data == null ||
                    state.data!.isEmpty) {
                  return TextWidget(
                    students: 'empty',
                    Color: Colors.white,
                  );
                } else if (filteredStudents.isEmpty) {
                  return Center(
                    child: TextWidget(
                      students: 'data Not found',
                      Color: Colors.white,
                      size: 20,
                      weight: FontWeight.bold,
                    ),
                  );
                } else {
                  final data = filteredStudents;
                  return ListView.builder(
                    itemCount: data.length,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 25),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(40, 158, 158, 158),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                color: Colors.grey.withOpacity(0.2),
                                offset: const Offset(0, 2),
                              )
                            ],
                          ),
                          height: 110,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextWidget(
                                  students: 'Name: ${data[index].name}',Color: Colors.white,
                                  weight: FontWeight.bold,
                                ),
                                TextWidget(
                                    students:
                                        'Roll No: ${data[index].rollNumber}',Color: Colors.white),
                                TextWidget(
                                    students:
                                        'Class: ${data[index].className}',Color: Colors.white),
                                TextWidget(
                                    students:
                                        'Phone: ${data[index].phoneNumber}',Color: Colors.white),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}

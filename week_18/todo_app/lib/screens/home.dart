import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/functions/push.dart';
import 'package:todo_app/screens/add_screen/add.dart';
import 'package:todo_app/screens/search/search.dart';
import 'package:todo_app/state_management/api_service/api_event.dart';
import 'package:todo_app/state_management/api_service/api_initial.dart';

import 'package:todo_app/state_management/api_service/api_state.dart';
import 'package:todo_app/state_management/home_view/bloc.dart';
import 'package:todo_app/state_management/home_view/event.dart';
import 'package:todo_app/state_management/home_view/state.dart';
import 'package:todo_app/widget/grid_view.dart';
import 'package:todo_app/widget/list_view.dart';
import 'package:todo_app/widget/text_form_field.dart';
import 'package:todo_app/widget/text_overflow.dart';

import '../state_management/api_service/api_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocBuilder<BlocManagement, ManageState>(
            builder: (context, state) {
              return ToggleButtons(
                isSelected: state.isSelect,
                onPressed: (index) {
                
                  context.read<BlocManagement>().add(ViewSelection(index));
                },
                children: const [
                  Icon(Icons.list, color: Colors.white),
                  Icon(Icons.grid_view, color: Colors.white),
                ],
              );
            },
          )
        ],
      ),
      body: BlocBuilder<BlocManagement, ManageState>(
        builder: (context, state) {
          final isList = state.isSelect[0];

          return SingleChildScrollView(
              child: BlocConsumer<ApiBloc, ApiState>(
                  listener: (context, studentData) {
            studentData.data;
          }, builder: (context, studentState) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.read<ApiBloc>().add(ApiGet());
            });
            if (studentState is ApiInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (studentState is ApiError) {
              return Center(child: Text('Error: ${studentState.error}'));
            } else if (studentState.data != null) {
              final students = studentState.data!;
              if (students.isEmpty) {
                return Container(
                  height: 500,
                  child: const Center(
                      child: Text(
                    "No students found",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )),
                );
              }
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                TextFormWidget(
                  isReadOnly: true,
                  onConform: () {
                    navigatorPush(context: context, screen: SearchScreen(student: studentState.data!,));
                  },
                  controller: controller,
                  text: 'Search',
                  padding: 30,
                  redius: 30,
                ),
                const SizedBox(height: 30),
                studentState.data != null
                    ? Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextWidget(
                          students: 'Student List',
                          Color: Colors.white,
                          weight: FontWeight.bold,
                          size: 18,
                        ),
                      )
                    : SizedBox.shrink(),
                isList
                    ? ListViewWidget(
                        students: studentState.data ?? [],
                      )
                    : GridViewWidget(students: studentState.data ?? [])
              ],
            );
          }));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigatorPush(context: context, screen: AddList());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

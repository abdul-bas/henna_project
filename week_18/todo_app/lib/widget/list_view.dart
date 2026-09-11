import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/functions/push.dart';
import 'package:todo_app/model/model.dart';
import 'package:todo_app/screens/delete/delete.dart';
import 'package:todo_app/screens/update/update.dart';
import 'package:todo_app/state_management/api_service/api_bloc.dart';
import 'package:todo_app/state_management/api_service/api_event.dart';
import 'package:todo_app/widget/text_overflow.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({
    super.key,
    required this.students,
  });

  final List<StudentModel> students;

  @override
  Widget build(BuildContext context) {
   

    if (students.isEmpty) {
      return Container(
        height: 300,
        child: Center(
          child: TextWidget(
            students: 'Empty',
            Color: Colors.white,
            weight: FontWeight.bold,
            size: 18,
          ),
        ),
      );
    }
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: students.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(50, 158, 158, 158),
                  borderRadius: BorderRadius.circular(15)),
              width: double.infinity,
              height: 110,
              child: Row(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            students: 'Name: ${students[index].name}',
                            Color: Colors.white,
                            weight: FontWeight.bold,
                          ),
                          TextWidget(
                            students: 'Rn: ${students[index].rollNumber}',
                            Color: Colors.white,
                          ),
                          TextWidget(
                            students: 'class: ${students[index].className}',
                            Color: Colors.white,
                          ),
                          TextWidget(
                            students: 'ph: ${students[index].phoneNumber}',
                            Color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              showDeleteDialog(context, () {
                                context
                                    .read<ApiBloc>()
                                    .add(ApiDelete(id: students[index].id!));
                              });
                            },
                            icon: Icon(
                              Icons.delete,
                              color: const Color.fromARGB(123, 244, 67, 54),
                            )),
                        IconButton(
                            onPressed: () {
                              navigatorPush(
                                  context: context,
                                  screen: UpdateData(id: students[index].id!));
                            },
                            icon: Icon(
                              Icons.edit,
                              color: const Color.fromARGB(120, 33, 149, 243),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/functions/push.dart';
import 'package:todo_app/model/model.dart';
import 'package:todo_app/screens/delete/delete.dart';
import 'package:todo_app/screens/update/update.dart';
import 'package:todo_app/state_management/api_service/api_bloc.dart';
import 'package:todo_app/state_management/api_service/api_event.dart';
import 'package:todo_app/widget/text_overflow.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: GridView.builder(
          itemCount: students.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns
              childAspectRatio: 10 / 10,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(50, 158, 158, 158),
              ),
              height: 75,
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 15),
                    child: Column(
                      spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          students: 'Name: ${students[index].name}',
                          weight: FontWeight.bold,
                          Color: Colors.white,
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
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: IconButton(
                                  onPressed: () {
                                    showDeleteDialog(context, () {
                                      context.read<ApiBloc>().add(
                                          ApiDelete(id: students[index].id!));
                                    });
                                  },
                                  icon: Container(
                                    height: 40,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color.fromARGB(37, 244, 67, 54)),
                                    child: Icon(
                                      Icons.delete,
                                      color: const Color.fromARGB(
                                          162, 244, 67, 54),
                                    ),
                                  )),
                            ),
                            Expanded(
                              child: Container(height: 40,width: 50,
                                decoration: BoxDecoration(color: const Color.fromARGB(33, 33, 149, 243),borderRadius: BorderRadius.circular(10)),
                                child: IconButton(
                                    onPressed: () {
                                      navigatorPush(
                                          context: context,
                                          screen: UpdateData(
                                              id: students[index].id!));
                                    },
                                    icon: Icon(
                                      Icons.edit,
                                      color:
                                          const Color.fromARGB(120, 33, 149, 243),
                                    )),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

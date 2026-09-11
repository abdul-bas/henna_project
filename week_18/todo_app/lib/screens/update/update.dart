import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/model/model.dart';
import 'package:todo_app/state_management/api_service/api_bloc.dart';
import 'package:todo_app/state_management/api_service/api_event.dart';
import 'package:todo_app/state_management/api_service/api_state.dart';
import 'package:todo_app/widget/text_form_field.dart';

class UpdateData extends StatelessWidget {
  UpdateData({super.key, required this.id});
  final int id;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _classController = TextEditingController();
  final TextEditingController _rollController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isInitialized = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApiBloc, ApiState>(
      builder: (context, state) {
        final List<StudentModel> student = state.data!;

        final currentData = student.firstWhere(
          (element) => element.id == id,
        );
        if (!isInitialized) {
          final name = currentData.name;
          _nameController.text = currentData.name;
          _classController.text = currentData.className;
          _rollController.text = currentData.rollNumber;
          _phoneController.text = currentData.phoneNumber;
          isInitialized = true;
        }
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios)),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                spacing: 20,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormWidget(
                    controller: _nameController,
                    text: 'Full Name',
                    validator: (value) {
                      if (value.isEmpty || value == null) {
                        return 'Please enter your name';
                      } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                        return 'Name must contain only letters';
                      } else if (value.length < 3) {
                        return 'Name must be at least 3 characters long';
                      }
                      return null;
                    },
                  ),
                  TextFormWidget(
                    controller: _rollController,
                    text: 'Roll Number',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Roll Number';
                      } else if (value.length < 3) {
                        return 'Name must be at least 3 characters long';
                      }
                      return null;
                    },
                  ),
                  TextFormWidget(
                    controller: _classController,
                    text: 'Class Name',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your class';
                      } else if (!RegExp(r'^[0-9]{1,2}[A-Za-z]?$')
                          .hasMatch(value)) {
                        return 'Class should be like "10", "10A", "7B"';
                      }
                      return null;
                    },
                  ),
                  TextFormWidget(
                    controller: _phoneController,
                    text: 'Phone Number',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter phone number';
                      } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                        return 'Phone number must be exactly 10 digits';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 50,
                    width: 150,
                    child: TextButton(
                        style: ButtonStyle(
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                          backgroundColor: WidgetStatePropertyAll(
                            Colors.white,
                          ),
                        ),
                        onPressed: () {
                          final name = _nameController.text.trim();
                          final roll = _rollController.text.trim();
                          final className = _classController.text.trim();
                          final phone = _phoneController.text.trim();
                          if (_formKey.currentState!.validate()) {
                            if (name.isNotEmpty &&
                                roll.isNotEmpty &&
                                className.isNotEmpty &&
                                phone.isNotEmpty) {
                              final student = StudentModel(
                                id: currentData.id,
                                name: _nameController.text.trim(),
                                rollNumber: _rollController.text.trim(),
                                className: _classController.text.trim(),
                                phoneNumber: _phoneController.text.trim(),
                              );
                              context
                                  .read<ApiBloc>()
                                  .add(ApiPut(value: student));

                              _classController.clear();
                              _nameController.clear();
                              _phoneController.clear();
                              _rollController.clear();
                              Navigator.pop(context);
                            }
                          }
                        },
                        child: Text('Submit',
                            style: TextStyle(color: Colors.black))),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

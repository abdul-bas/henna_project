import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {super.key, required this.students, this.weight, this.size, this.Color});

  final FontWeight? weight;
  final double? size;
  final students;
  final Color;

  @override
  Widget build(BuildContext context) {
    return Text(students,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: TextStyle(
            color: Color ?? Colors.black, fontWeight: weight, fontSize: size));
  }
}
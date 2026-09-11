import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget(
      {super.key,
      this.padding,
      this.redius,
      this.icon,
      required this.text,
      this.controller,
      this.isReadOnly,
      this.onConform,
      this.onChangeConform,
      this.validator,this.sufixWidget});
  final double? padding;
  final double? redius;
  final IconData? icon;
  final String text;
  final TextEditingController? controller;
  final bool? isReadOnly;
  final VoidCallback? onConform;
  final Function(String)? onChangeConform;
  final Function(String)? validator;
  final Widget? sufixWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: padding ?? 25, right: padding ?? 25),
      child: TextFormField(
        onChanged: (value) {
          if (onChangeConform != null) {
            onChangeConform!(value);
          }
        },
        readOnly: isReadOnly != null ? true : false,
        onTap: () {
          if (onConform != null) {
            onConform!();
          }
        },
        validator: (value) {
          if (validator != null) {
            return validator!(value!);
          }
          return null;
        },
        style: TextStyle(
          color: Colors.black,
        ),
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: sufixWidget??SizedBox.shrink(),
            focusColor: Colors.black,
            fillColor: Colors.white,
            filled: true,
            labelStyle: TextStyle(
              color: Colors.black,
            ),
           hintText: text,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(redius ?? 15),
                borderSide: BorderSide.none)),
      ),
    );
  }
}

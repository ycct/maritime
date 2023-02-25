import 'package:flutter/material.dart';
import 'package:maritime/utilities/extentions.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final double fontSize;
  final bool enabled;
  final TextEditingController controller;

  const CustomTextField({
    Key? key,
    required this.title,
    required this.fontSize,
    required this.controller,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: context.primaryColor,
      style: TextStyle(fontSize: fontSize),
      enabled: enabled,
      keyboardType: TextInputType.multiline,
      maxLines: 15,
      minLines: 1,
      controller: controller,
      decoration: InputDecoration(
        hoverColor: context.primaryColor,
          border: InputBorder.none,
          hintText: title,
          hintStyle: TextStyle(
            fontSize: fontSize,
            color: Colors.black,
          )),
    );
  }
}

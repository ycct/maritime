import 'package:flutter/material.dart';

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
      enabled: enabled,
      keyboardType: TextInputType.multiline,
      controller: controller,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: title,
          hintStyle: TextStyle(
            fontSize: fontSize,
            color: Colors.black,
          )),
    );
  }
}

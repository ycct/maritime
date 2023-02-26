import 'package:flutter/material.dart';
import 'package:maritime/utilities/extentions.dart';

class CategoryCards extends StatelessWidget {
  final String title;
  final bool isSelected;

  const CategoryCards({
    Key? key,
    required this.title,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          50,
        ),
        color: isSelected ? Colors.blue.shade200 : Colors.orange.shade100,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isSelected
                  ? context.dialogBackgroundColor
                  : context.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}

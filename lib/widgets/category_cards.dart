import 'package:flutter/material.dart';

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
        color: isSelected ? Colors.blue : Colors.blue.withOpacity(0.5),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              color: isSelected ? Colors.white : Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
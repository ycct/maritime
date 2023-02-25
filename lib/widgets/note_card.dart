import 'package:flutter/material.dart';
import 'package:maritime/utilities/constants.dart';
import 'package:maritime/utilities/extentions.dart';
import 'package:maritime/utilities/fonts.dart';

class NoteCard extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String content;
  final String category;
  final Color color;

  const NoteCard({
    Key? key,
    required this.onTap,
    required this.title,
    required this.content,
    required this.category,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppConstants.smallPadding),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(
            AppConstants.smallPadding,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: customFont20Bold,
              overflow: TextOverflow.ellipsis,
            ),
            context.sizedBoxHeightUltraSmall,
            Text(
              category,
              style: customFont12LightBold.copyWith(
                color: context.errorColor,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            context.sizedBoxHeightUltraSmall,
            Text(
              content,
              style: customFont16,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}

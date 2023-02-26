import 'package:flutter/material.dart';
import 'package:maritime/utilities/constants.dart';
import 'package:maritime/utilities/extentions.dart';
import 'package:maritime/utilities/fonts.dart';

class NoteCard extends StatelessWidget {
  final VoidCallback onTap;
  final VoidCallback onDeleteTap;
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
    required this.onDeleteTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        children: [
          Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
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
                  style: customFont12LightBold,
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
          Positioned(
            right: 10,
            bottom: 10,
            child: GestureDetector(
              onTap: onDeleteTap,
              child: CircleAvatar(
                radius: 13,
                backgroundColor: context.dialogBackgroundColor,
                child: Icon(Icons.delete_outline,
                    size: 18, color: context.primaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

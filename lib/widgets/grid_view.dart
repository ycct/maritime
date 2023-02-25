import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maritime/models/note_model.dart';
import 'package:maritime/screens/note_detail_screen.dart';
import 'package:maritime/utilities/constants.dart';
import 'package:maritime/widgets/note_card.dart';

class CustomGridView extends StatelessWidget {
  final List<Note> list;

  const CustomGridView({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.defaultPadding,
      ),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: list.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (BuildContext context, int index) {
          return NoteCard(
            onTap: () {
              Get.to(
                () => NoteDetailScreen(
                  note: list[index],
                ),
              );
            },
            title: list[index].title!,
            content: list[index].note!,
            category: list[index].category!,
          );
        },
      ),
    );
  }
}

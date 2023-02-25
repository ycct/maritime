import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maritime/controllers/home_controller.dart';
import 'package:maritime/models/note_model.dart';
import 'package:maritime/utilities/constants.dart';
import 'package:maritime/utilities/theme.dart';
import '../widgets/textfield.dart';

class NoteDetailScreen extends StatelessWidget {
  final Note note;

  const NoteDetailScreen({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (HomeController h) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: CustomThemeData.cardsColor[2],
          elevation: 0,
        ),
        backgroundColor: CustomThemeData.cardsColor[2],
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.defaultPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                enabled: false,
                title: note.title!,
                fontSize: 20,
                controller: h.titleCont,
              ),
              CustomTextField(
                enabled: false,
                title: note.note!,
                fontSize: 14,
                controller: h.noteCont,
              ),
            ],
          ),
        ),
      );
    });
  }
}

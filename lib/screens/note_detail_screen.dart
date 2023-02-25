import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maritime/controllers/home_controller.dart';
import 'package:maritime/models/note_model.dart';
import 'package:maritime/utilities/constants.dart';
import 'package:maritime/utilities/extentions.dart';
import 'package:maritime/utilities/theme.dart';
import '../widgets/textfield.dart';

class NoteDetailScreen extends StatelessWidget {
  final Note note;

  const NoteDetailScreen({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (HomeController h) {
      return Scaffold(
        floatingActionButton: Visibility(
          visible: h.textEditingEnable,
          child: FloatingActionButton.extended(
            backgroundColor: context.primaryColor,
            onPressed: () {
              h.changeEditingValue();
              h.editNote(note);
              h.saveEditedNoteToLocalDb(note);
            },
            label: const Text("Save"),
            icon: const Icon(Icons.save),
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text("Note",style: TextStyle(color: context.primaryColor)),
          leading: InkWell(
            onTap: Get.back,
            child: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: CustomThemeData.blackColor,
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                h.changeEditingValue();
                h.editNoteFirst(note);
              },
              child: Icon(
                Icons.edit_note,
                size: 26,
                color: CustomThemeData.blackColor,
              ),
            ),
            context.sizedBoxWidthSmall,
          ],
          backgroundColor: AppConstants.cardsColor[1],
          elevation: 0,
        ),
        backgroundColor: AppConstants.cardsColor[1],
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.defaultPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                enabled: h.textEditingEnable,
                title: note.title!,
                fontSize: 20,
                controller: h.titleCont,
              ),
              CustomTextField(
                enabled: h.textEditingEnable,
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

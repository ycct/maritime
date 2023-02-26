import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maritime/controllers/home_controller.dart';
import 'package:maritime/models/note_model.dart';
import 'package:maritime/services/notification_services.dart';
import 'package:maritime/utilities/constants.dart';
import 'package:maritime/utilities/extentions.dart';
import 'package:maritime/utilities/theme.dart';
import 'package:maritime/widgets/snackbar.dart';
import '../widgets/textfield.dart';
import 'package:share_plus/share_plus.dart';

class NoteDetailScreen extends StatelessWidget {
  final Note note;
  final Color color;

  const NoteDetailScreen({Key? key, required this.note, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (HomeController h) {
      double iconSize = 20;
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
            label: Text("save".tr),
            icon: const Icon(Icons.save),
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "note".tr,
            style: TextStyle(
              color: context.primaryColor,
            ),
          ),
          leading: InkWell(
            onTap: Get.back,
            child: Icon(
              Icons.arrow_back_ios,
              size: iconSize,
              color: context.primaryColor,
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
                size: iconSize+6,
                color: context.primaryColor,
              ),
            ),
            context.sizedBoxWidthSmall,
            InkWell(
              onTap: () async {
                setReminderEvent(h);
              },
              child: Icon(
                Icons.lock_clock,
                size: iconSize,
                color: CustomThemeData.blackColor,
              ),
            ),
            context.sizedBoxWidthSmall,
            InkWell(
              onTap: () async {
                await Share.share(note.note!);
              },
              child: Icon(
                Icons.share,
                size: iconSize,
                color: CustomThemeData.blackColor,
              ),
            ),
            context.sizedBoxWidthSmall,
          ],
          backgroundColor: color,
          elevation: 0,
        ),
        backgroundColor: color,
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

  setReminderEvent(HomeController h) {
    chooseTime(h).then(
      (value) => NotificationService().showNotification(1,
          "${"leftTime".tr} - ${note.title!}", note.note!, h.selectedTimeInt),
    );
  }

  Future chooseTime(HomeController h) async {
    TimeOfDay? pickedTime = await showTimePicker(
        context: Get.context!,
        initialTime: h.selectedTime,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              alwaysUse24HourFormat: true,
            ),
            child: child!,
          );
        },
        helpText: "enterTime".tr,
        cancelText: "cancel".tr,
        minuteLabelText: "second".tr,
        hourLabelText: "minute".tr,
        initialEntryMode: TimePickerEntryMode.input);

    if (pickedTime != null && pickedTime != h.selectedTime) {
      h.timeSetter(pickedTime);
      CustomSnackBar.showSuccessMessage("reminderSuccess.".tr);
    }
  }
}

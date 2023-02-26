import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:maritime/models/note_model.dart';
import 'package:maritime/utilities/boxes.dart';
import 'package:maritime/utilities/constants.dart';

enum CategoryEnum { finance, personal, shopping }

class HomeController extends GetxController {
  var selectedTime = const TimeOfDay(hour: 00, minute: 00);
  int selectedTimeInt = 0;

  int selectedCategoryIndex = 0;
  int selectedCategoryIndexAll = 0;

  TextEditingController noteCont = TextEditingController();
  TextEditingController titleCont = TextEditingController();
  TextEditingController imageCont = TextEditingController();

  Box<Note>? box;
  bool textEditingEnable = false;

  List<Note> noteListAll = [];
  List<List<Note>> bigData = [];
  List<Note> noteListFinance = [];
  List<Note> noteListPersonal = [];
  List<Note> noteListShopping = [];

  @override
  onInit() {
    super.onInit();
    box = Boxes.getNotes();
    noteListAll = box!.values.toList();
    categorizeList();
  }

  changeEditingValue() {
    textEditingEnable = !textEditingEnable;
    update();
  }

  timeSetter(TimeOfDay pickedTime) {
    selectedTime = pickedTime;
    selectedTimeInt = (selectedTime.hour * 60 + selectedTime.minute) > 300
        ? (selectedTime.hour * 60 + selectedTime.minute) - 300
        : (selectedTime.hour * 60 + selectedTime.minute) - 0;
  }

  saveEditedNoteToLocalDb(Note note) {
    note
      ..category = note.category
      ..note = noteCont.text
      ..image = ""
      ..title = titleCont.text;
    note.save();
  }

  editNoteFirst(Note note) {
    noteCont.text = note.note!;
    titleCont.text = note.title!;
  }

  deleteNote(Note note) {
    noteListAll.remove(note);
    if (note.category == AppConstants.categoryList[0]) {
      noteListFinance.remove(note);
    } else if (note.category == AppConstants.categoryList[1]) {
      noteListPersonal.remove(note);
    } else {
      noteListShopping.remove(note);
    }
    update();
  }

  editNote(Note note) {
    note
      ..note = noteCont.text
      ..title = titleCont.text;
    update();
  }

  saveNoteToAll() {
    Note note = Note()
      ..category = AppConstants.categoryList[selectedCategoryIndex]
      ..note = noteCont.text
      ..image = ""
      ..title = titleCont.text;
    bigData[selectedCategoryIndex].add(note);
    noteListAll.add(note);
    addNotestoLocalDb(note);
    update();
  }

  assignLists() {
    bigData = [noteListFinance, noteListPersonal, noteListShopping];
  }

  categorizeList() {
    for (var element in noteListAll) {
      if (element.category == AppConstants.categoryList[0]) {
        noteListFinance.add(element);
      } else if (element.category == AppConstants.categoryList[1]) {
        noteListPersonal.add(element);
      } else {
        noteListShopping.add(element);
      }
    }
  }

  clearFields() {
    titleCont.clear();
    noteCont.clear();
    update();
  }

  changeIndex(int value) {
    selectedCategoryIndex = value;
    update();
  }
  changeIndexAll(int value) {
    selectedCategoryIndexAll = value;
    update();
  }

  Future addNotestoLocalDb(Note note) async {
    box!.add(note);
  }

  deleteNotesFromLocalDb(Note note) {
    note.delete();
  }
}

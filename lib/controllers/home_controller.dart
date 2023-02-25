import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:maritime/models/note_model.dart';
import 'package:maritime/utilities/boxes.dart';
import 'package:maritime/utilities/constants.dart';

enum CategoryEnum { finance, personal, shopping }

class HomeController extends GetxController {
  int selectedIndex = 0;

  TextEditingController noteCont = TextEditingController();
  TextEditingController titleCont = TextEditingController();
  TextEditingController imageCont = TextEditingController();

  Box<Note>? box;

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

  saveNoteToAll() {
    Note note = Note()
      ..category = AppConstants.categoryList[selectedIndex]
      ..note = noteCont.text
      ..image = ""
      ..title = titleCont.text;
    bigData[selectedIndex].add(note);
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
    selectedIndex = value;
    update();
  }

  Future addNotestoLocalDb(Note note) async {
    box!.add(note);
  }
}

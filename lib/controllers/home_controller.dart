import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:maritime/models/note_model.dart';
import 'package:maritime/utilities/boxes.dart';

enum CategoryEnum { finance, personal, shopping }

class HomeController extends GetxController {
  int selectedIndex = 0;
  TextEditingController noteCont = TextEditingController();
  TextEditingController titleCont = TextEditingController();
  TextEditingController imageCont = TextEditingController();
  List<Note> noteListAll = [];
  List<List<Note>> bigData = [];
  List<Note> noteListFinance = [];
  List<Note> noteListPersonal = [];
  List<Note> noteListShopping = [];
  List<String> categoryList = ["Finans", "Kişisel", "Alışveriş Listesi"];
  List<String> categoryListAll = [
    "Tümü",
    "Finans",
    "Kişisel",
    "Alışveriş Listesi"
  ];

  saveNoteToAll() {
    Note note = Note();
    note = note
      ..category = categoryList[selectedIndex]
      ..note = noteCont.text
      ..title = titleCont.text;
    noteListAll.add(note);
    bigData[selectedIndex].add(note);
    update();
  }

  assignLists() {
    bigData = [noteListFinance, noteListPersonal, noteListShopping];
  }

  clearFields() {
    titleCont.clear();
    noteCont.clear();
    update();
  }

  saveNoteToAll2() {
    noteListAll.add(
      Note(
        title: titleCont.text,
        note: noteCont.text,
        category: categoryList[selectedIndex],
      ),
    );
    titleCont.clear();
    noteCont.clear();
    update();
  }

  changeIndex(int value) {
    selectedIndex = value;
    update();
  }

  Future addNotes(
      String myNote, String category, String title, String image) async {
    final note = Note()
      ..note = myNote
      ..category = category
      ..title = title
      ..image = image;
    final box = Boxes.getNotes();
    box.add(note);
  }
}

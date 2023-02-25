import 'package:hive/hive.dart';
import 'package:maritime/models/note_model.dart';

class Boxes {
  static Box<Note> getNotes ()=> Hive.box<Note>("notes");
}
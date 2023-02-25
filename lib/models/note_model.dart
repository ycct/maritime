import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class Note extends HiveObject {
  @HiveField(0)
  late String? note;
  @HiveField(1)
  late String? category;
  @HiveField(2)
  late String? title;
  @HiveField(3)
  late String? image;

  Note({this.image, this.note, this.title, this.category});
}

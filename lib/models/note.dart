import "package:isar/isar.dart";

// this line is needed to generate the database file where data is stored
// then run: dart run build_runner build
part 'note.g.dart';

@collection
class Note {
  Id id = Isar.autoIncrement;
  late String text;
}
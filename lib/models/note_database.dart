import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:notesapp/models/note.dart';
import 'package:path_provider/path_provider.dart';

class NoteDatabase extends ChangeNotifier {
  static late Isar isar;
  //INITIALIZE DATABASE
  static Future<void> initialize()async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
        [NoteSchema],
        directory: dir.path
    );
  }

  //list of notes
  final List<Note> currentNotes = [];


  //CREATE - a note and save to db
  Future<void> addNote(String textFromUser) async {

    // create a new note object
    final newNote = Note()..text = textFromUser;

    // save to db
    await isar.writeTxn(() => isar.notes.put(newNote)); //remove as Note if code fails

    // re-read from db
    fetchNotes();
  }

  //READ - notes from db
  Future<void> fetchNotes() async {
    //gets all the notes in the database
    List<Note> fetchNotes = await isar.notes.where().findAll();
    //clears cureent notes
    currentNotes.clear();
    currentNotes.addAll(fetchNotes);
    notifyListeners();
  }


  //UPDATE - a note in db
  //ID is used to check if the note exists, if it does it stores the new note in newtext and updates the note
  Future<void> updateNote(int id, String newText) async {
    final existingNote = await isar.notes.get(id);
    if (existingNote != null){
      existingNote.text = newText;
      await isar.writeTxn(()=> isar.notes.put(existingNote));
      await fetchNotes();
    }
  }

  //DELETE - a note from the db
  Future<void> deleteNote(int id) async {
    await isar.writeTxn(() => isar.notes.delete(id));
    await fetchNotes();
  }
}

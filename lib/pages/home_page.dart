import 'package:flutter/material.dart';
import 'package:notesapp/components/my_list_tile.dart';
import 'package:notesapp/main.dart';
import 'package:notesapp/models/note_database.dart';
import 'package:provider/provider.dart';

import '../components/my_drawer.dart';
import '../models/note.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //text controller to get accesss to what the user type
  final textController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    // on app startup, fetch existing notes
     readNotes();
  }

  //create a note
  void createNote (){
    showDialog(context: context,
        builder: (context) => AlertDialog(
          content: TextField(
            controller: textController,
          ),
          actions: [
            //createButton
            MaterialButton(
                onPressed: (){
                  context.read<NoteDatabase>().addNote(textController.text);
                  //clear controller
                  textController.clear();

                  //close dialog
                  Navigator.pop(context);
                },
              child: const Text("Create"),
            )
          ],
        )
    );
  }
  //read a note
  void readNotes(){
    context.read<NoteDatabase>().fetchNotes();
  }
  //update a note
  void updateNote(Note note){
    textController.text = note.text;
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Update Note"),
          content: TextField(controller: textController,),
          actions: [
            //createButton
            MaterialButton(
            onPressed: (){
              context.read<NoteDatabase>().updateNote(note.id, textController.text);
              textController.clear();
              //pop dialog box
              Navigator.pop(context);
              },
              child: const Text("Update"),
            )
          ],
        )
    );
  }
  //delete a note
  void deleteNote(int id){
    context.read<NoteDatabase>().deleteNote(id);
  }

  @override
  Widget build(BuildContext context) {
    // note Database
    final noteDatabase = context.watch<NoteDatabase>();

    //current notes
    List<Note> currentNotes = noteDatabase.currentNotes;

    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: createNote,
          child: const Icon(Icons.add),
      ),
      drawer: MyDrawer(),
      body: ListView.builder(
        itemCount: currentNotes.length,
          itemBuilder: (context, index){
            //get individual note
            final note = currentNotes[index];

            //list tile UI
            return MyListTile(
              noteText: note.text,
              editFunction: ()=> updateNote(note),
              deleteFunction: ()=> deleteNote(note.id),
            );
          }
      ),
    );
  }
}

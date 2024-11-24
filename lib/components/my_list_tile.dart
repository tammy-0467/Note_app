import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

import 'note_settings.dart';

class MyListTile extends StatelessWidget {
  final String noteText;
  final void Function()? editFunction;
  final void Function()? deleteFunction;
  MyListTile({super.key, required this.noteText, required this.editFunction, required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 5),
      child: Container(
        padding: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          title: Text(noteText,
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary
            ),
          ),
          trailing: Builder(
            builder: (context) => IconButton(
                onPressed: ()=> showPopover(
                    context: context,
                    width: 100,
                    height: 100,
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    bodyBuilder: (context) => NoteSettings(
                      editTap: editFunction,
                      deleteTap: deleteFunction,
                    )
                ),
                icon: Icon(Icons.more_vert)),
          )
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class NoteSettings extends StatelessWidget {
  final void Function()? editTap;
  final void Function()? deleteTap;

  NoteSettings({super.key, required this.editTap, required this.deleteTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //edit button
            GestureDetector(
              onTap: editTap,
              child: Container(
                  height: 50,
                  color: Theme.of(context).colorScheme.surface,
                  child: Text("Edit",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  )
              ),
            ),

            //delete button
            GestureDetector(
              onTap: deleteTap,
              child: Container(
                  height: 50,
                  color: Theme.of(context).colorScheme.surface,
                  child: Text("Delete",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:notes_app/widgets/custom_notes_item.dart';

class NotesListViewItem extends StatelessWidget {
  const NotesListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.all(0),
        itemBuilder: (context, index) {
          return CustomNotesItem();
        },
        itemCount: 5,
      ),
    );
  }
}

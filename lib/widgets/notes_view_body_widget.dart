import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_app_bar_widget.dart';
import 'package:notes_app/widgets/custom_notes_item.dart';
import 'package:notes_app/widgets/list_view_notes_item.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [SizedBox(height: 30), CustomAppBar(), ListViewNotesItem()],
      ),
    );
  }
}

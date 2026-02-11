import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_app_bar_widget.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const EditNotesViewBody());
  }
}

class EditNotesViewBody extends StatelessWidget {
  const EditNotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height: 30),
          CustomAppBar(text: 'Edit Note', icon: Icon(Icons.check)),
        ],
      ),
    );
  }
}

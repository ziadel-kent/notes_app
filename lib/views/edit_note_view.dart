import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_app_bar_widget.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(body: const EditNotesViewBody()),
    );
  }
}

class EditNotesViewBody extends StatelessWidget {
  const EditNotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 30),
            CustomAppBar(text: 'Edit Note', icon: Icon(Icons.check)),
            CustomTextField(hint: 'Title'),
            CustomTextField(hint: 'Content', maxLines: 5),
          ],
        ),
      ),
    );
  }
}

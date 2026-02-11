import 'package:flutter/material.dart';
import 'package:notes_app/widgets/notes_view_body_widget.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: CircleBorder(),
        backgroundColor: Colors.greenAccent,
        child: Icon(Icons.add, color: Colors.black),
      ),
      body: NotesViewBody(),
    );
  }
}

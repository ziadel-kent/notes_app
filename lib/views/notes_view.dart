import 'package:flutter/material.dart';
import 'package:notes_app/widgets/notes_view_body_widget.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   title: const Row(
      //     mainAxisSize: MainAxisSize.min,
      //     children: [
      //       Text(
      //         'News',
      //         style: TextStyle(color: Colors.black),
      //       ),
      //       Text(
      //         'Cloud',
      //         style: TextStyle(color: Colors.orange),
      //       ),
      //     ],
      //   ),
      // ),
      body: NotesViewBody(),
    );
  }
}


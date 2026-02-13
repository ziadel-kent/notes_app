import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/notes_cubit.dart';
import 'package:notes_app/model/notes_model.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:notes_app/views/widgets/custom_notes_item.dart';

class NotesListViewItem extends StatelessWidget {
  const NotesListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NotesModel> notes = BlocProvider.of<NotesCubit>(context).notes!;
        return Expanded(
          child: ListView.builder(
            padding: EdgeInsets.all(0),
            itemBuilder: (context, index) {
              return CustomNotesItem(notes: notes[index]);
            },
            itemCount: notes.length,
          ),
        );
      },
    );
  }
}

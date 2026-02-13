import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:notes_app/model/notes_model.dart';
import 'package:notes_app/views/edit_note_view.dart';

class CustomNotesItem extends StatelessWidget {
  const CustomNotesItem({super.key, required this.notes});
  final NotesModel notes;

  @override
  Widget build(BuildContext context) {
    final dt = DateTime.tryParse(notes.date);
    final formattedDate =
        dt != null ? DateFormat('MMMM dd, yyyy').format(dt) : notes.date;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return EditNoteView();
            },
          ),
        );
      },
      child: Card(
        child: Container(
          padding: EdgeInsets.only(left: 20, bottom: 20, top: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color(0xffFFCC80),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                contentPadding: EdgeInsets.all(0),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.delete, color: Colors.black, size: 32),
                ),
                title: Text(
                  notes.title,
                  style: TextStyle(color: Colors.black, fontSize: 26),
                ),

                subtitle: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    notes.subTitle,
                    style: TextStyle(
                      color: Colors.black.withOpacity(.6),
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 8),
                child: Text(
                  formattedDate,
                  style: TextStyle(color: Colors.black.withOpacity(.4)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

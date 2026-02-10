import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_notes_item.dart';

class ListViewNotesItem extends StatelessWidget {
  const ListViewNotesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return CustomNotesItem();
        },
        itemCount: 5,
      ),
    );
  }
}

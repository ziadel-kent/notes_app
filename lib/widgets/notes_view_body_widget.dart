import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_app_bar_widget.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          SizedBox(height: 50),
          CustomAppBar(),
          Card(
            child: Container(
              height: 170,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ListTile(
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.delete, color: Colors.black),
                    ),
                    title: Text('data', style: TextStyle(color: Colors.black)),
                    subtitle: Text(
                      'data',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Text('MAY21,2021'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

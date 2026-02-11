import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(children: [SizedBox(height: 32), CustomTextField()]),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Title',
          hintStyle: TextStyle(color: kPrimaryColor),
          // border: borderMethod(),
          enabledBorder: borderMethod(),
          focusedBorder: borderMethod(Color: kPrimaryColor),
        ),
      ),
    );
  }

  OutlineInputBorder borderMethod({Color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Color ?? Colors.white),
    );
  }
}

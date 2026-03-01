import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/views/widgets/add_note_bottom_sheet.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  const CustomTextField({
    super.key,
    this.hint,
    this.maxLines = 1,
    this.onSaved,
    this.onChanged,
    required this.controller,
  });
  final String? hint;
  final int maxLines;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required ';
        }
        // if (hint == 'Content') {
        //   if (value!.length < 8) {
        //     return 'minimum 8 letters required ';
        //   }
        // }
      },
      onSaved: onSaved,
      textDirection: TextDirection.ltr,
      controller: controller,
      textAlign: TextAlign.justify,

      maxLines: maxLines,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint,

        hintFadeDuration: Duration(seconds: 1),
        
        hintStyle: TextStyle(color: kPrimaryColor),
        // border: borderMethod(),
        enabledBorder: borderMethod(),
        errorBorder: borderMethod(
          Color: const Color.fromARGB(255, 184, 104, 98),
        ),
        focusedBorder: borderMethod(Color: kPrimaryColor),
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

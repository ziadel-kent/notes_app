import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hint, this.maxLines = 1});
  final String hint;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return  TextField(
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hint,
          hintFadeDuration: Duration(seconds: 3),

          hintStyle: TextStyle(color: kPrimaryColor),
          // border: borderMethod(),
          enabledBorder: borderMethod(),
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

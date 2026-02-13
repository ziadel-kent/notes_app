import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_app_bar_widget.dart';
import 'package:notes_app/views/widgets/custom_button.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

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

class EditNotesViewBody extends StatefulWidget {
  const EditNotesViewBody({super.key});

  @override
  State<EditNotesViewBody> createState() => _EditNotesViewBodyState();
}

class _EditNotesViewBodyState extends State<EditNotesViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
                SizedBox(height: 30),
                CustomAppBar(text: 'Edit Note', icon: Icon(Icons.check)),
                SizedBox(height: 15),
                CustomTextField(
                  hint: 'Title',
                  onSaved: (value) {
                    title = value;
                  },
                ),
                SizedBox(height: 30),
                CustomTextField(
                  hint: 'Content',
                  maxLines: 5,
                  onSaved: (value) {
                    title = value;
                  },
                ),
                SizedBox(height: 30),
                CustomButton(
                  isLoading: false,
                  text: 'Update',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                    }
                    // else{
                    //   autovalidateMode=AutovalidateMode
                    // }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/add_notes/add_notes_cubit.dart';
import 'package:notes_app/cubit/notes_cubit.dart';
import 'package:notes_app/model/notes_model.dart';
import 'package:notes_app/views/widgets/custom_app_bar_widget.dart';
import 'package:notes_app/views/widgets/custom_button.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.notesModel});
  final NotesModel notesModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(body: EditNotesViewBody(notesModel: notesModel)),
    );
  }
}

class EditNotesViewBody extends StatefulWidget {
  EditNotesViewBody({super.key, required this.notesModel});
  NotesModel notesModel;

  @override
  State<EditNotesViewBody> createState() => _EditNotesViewBodyState();
}

class _EditNotesViewBodyState extends State<EditNotesViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction;
  // TextEditingController textController = TextEditingController();
  // TextEditingController SubTextController = TextEditingController();

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
                CustomAppBar(
                  text: 'Edit Note',
                  icon: Icon(Icons.check),
                  onPressed: () {
                    widget.notesModel.title = title ?? widget.notesModel.title;
                    widget.notesModel.subTitle =
                        subTitle ?? widget.notesModel.subTitle;
                    widget.notesModel.save();
                    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: 15),
                CustomTextField(
                  hint: '${widget.notesModel.title}',
                  onChanged: (value) {
                    title = value;
                  },
                ),
                SizedBox(height: 30),
                CustomTextField(
                  hint: '${widget.notesModel.subTitle}',
                  maxLines: 5,
                  onChanged: (value) {
                    title = value;
                  },
                ),
                SizedBox(height: 30),
                // CustomButton(
                //   isLoading: false,
                //   text: 'Update',
                //   onTap: () {
                //     if (formKey.currentState!.validate()) {
                //       formKey.currentState!.save();
                //     }
                //     // else{
                //     //   autovalidateMode=AutovalidateMode
                //     // }
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

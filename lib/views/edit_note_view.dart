import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/notes_cubit.dart';
import 'package:notes_app/model/notes_model.dart';
import 'package:notes_app/views/widgets/custom_app_bar_widget.dart';
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
  Color selectedColor = Colors.red;

  final List<Color> colors = [
    Color(0xffE1D9B0),
    Color(0xff31442D),
    Color(0xff617345),
    Color(0xff3a605e),
    Color(0xff001514),
  ];

  late TextEditingController titleController;
  late TextEditingController contentController;
  String? title, subTitle;
  @override
  void initState() {
    super.initState();

    titleController = TextEditingController(text: widget.notesModel.title);

    contentController = TextEditingController(text: widget.notesModel.subTitle);
  }

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<AddNotesCubit>(context).color = selectedColor;
    widget.notesModel.color = selectedColor.value;
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
                    widget.notesModel.title = title ?? titleController.text;
                    widget.notesModel.subTitle =
                        subTitle ?? widget.notesModel.subTitle;
                    widget.notesModel.save();
                    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: 15),
                CustomTextField(
                  controller: titleController,
                  hint: widget.notesModel.title,
                  onChanged: (value) {
                    title = value;
                  },
                ),
                SizedBox(height: 30),
                CustomTextField(
                  controller: contentController,
                  hint: widget.notesModel.subTitle,
                  maxLines: 5,
                  onChanged: (value) {
                    subTitle = value;
                  },
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                      colors.map((color) {
                        bool isSelected = selectedColor == color;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedColor = color;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              color: color,
                              shape: BoxShape.circle,
                              border:
                                  isSelected
                                      ? Border.all(
                                        color: Colors.white70,
                                        width: 3,
                                      )
                                      : null,
                            ),
                          ),
                        );
                      }).toList(),
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

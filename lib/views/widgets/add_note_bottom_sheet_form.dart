import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/add_notes/add_notes_cubit.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:notes_app/cubit/speech_to_text_cubit.dart';
import 'package:notes_app/model/notes_model.dart';
import 'package:notes_app/views/widgets/add_note_bottom_sheet.dart';
import 'package:notes_app/views/widgets/custom_button.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';
import 'package:notes_app/views/widgets/speech_icon_widget.dart';

class AddNoteForm extends StatefulWidget {
  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  void pickColor(BuildContext context) {
    Color tempColor = selectedColor; // يبدأ باللون الحالي
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text('Pick Note Color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: tempColor,
              onColorChanged: (color) {
                tempColor = color;
              },
              showLabel: true,
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedColor = tempColor; // حفظ اللون الجديد
                });
                Navigator.of(ctx).pop();
              },
              child: Text('Select'),
            ),
          ],
        );
      },
    );
  }

  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  Color selectedColor = Colors.red;

  final List<Color> colors = [
    Color(0xffE1D9B0),
    Color(0xff31442D),
    Color(0xff617345),
    Color(0xff3a605e),
    Color(0xff001514),
  ];

  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(height: 32),

          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  controller: titleController,
                  hint: 'Title',
                  onSaved: (value) {
                    title = value;
                  },
                ),
              ),
              IconSpeech(controller: titleController),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  controller: contentController,
                  hint: 'Content',
                  maxLines: 5,
                  onSaved: (value) {
                    subTitle = value;
                  },
                ),
              ),
              IconSpeech(controller: contentController),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...colors.map((color) {
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
                              ? Border.all(color: Colors.white70, width: 3)
                              : null,
                    ),
                  ),
                );
              }).toList(),
              IconButton(
                icon: Icon(Icons.color_lens, color: selectedColor),
                onPressed: () => pickColor(context),
              ),
            ],
          ),
          SizedBox(height: 16),

          BlocBuilder<AddNotesCubit, AddNotesState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNotesLoading ? true : false,
                text: 'Add',
                onTap: () {
                  context.read<SpeechCubit>().stopRecording();
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var noteModel = NotesModel(
                      title: title!,
                      color: selectedColor.value,
                      date: DateTime.now().toString(),
                      subTitle: subTitle!,
                    );
                    BlocProvider.of<AddNotesCubit>(context).addNote(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                },
              );
            },
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}

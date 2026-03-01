
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/speech_to_text_cubit.dart';

class IconSpeech extends StatelessWidget {
  final TextEditingController controller;

  const IconSpeech({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SpeechCubit, SpeechState>(
      listener: (context, state) {
        final cubit = context.read<SpeechCubit>();

        if (state is SpeechResult && cubit.activeController == controller) {
          controller.text = state.text;

          controller.selection = TextSelection.fromPosition(
            TextPosition(offset: controller.text.length),
          );
        }
      },
      child: BlocBuilder<SpeechCubit, SpeechState>(
        builder: (context, state) {
          final cubit = context.read<SpeechCubit>();

          return IconButton(
            onPressed: () {
              cubit.activeController = controller;
              cubit.toggleRecording();
            },
            icon: Icon(
              cubit.isListening && cubit.activeController == controller
                  ? Icons.stop
                  : Icons.mic,
              color:
                  cubit.isListening && cubit.activeController == controller
                      ? Colors.red
                      : Colors.black,
            ),
          );
        },
      ),
    );
  }
}

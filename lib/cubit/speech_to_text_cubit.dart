import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_to_text/speech_to_text.dart';
part 'speech_to_text_state.dart';

class SpeechCubit extends Cubit<SpeechState> {
  SpeechCubit() : super(SpeechInitial());

  final SpeechToText speech = SpeechToText();

  bool isListening = false;

  TextEditingController? activeController;

  Future<bool> requestMicrophonePermission() async {
    var status = await Permission.microphone.status;
    if (status.isGranted) return true;

    status = await Permission.microphone.request();
    return status.isGranted;
  }

  Future<void> toggleRecording() async {
    bool granted = await requestMicrophonePermission();
    if (!granted) return;

    bool available = await speech.initialize(
      onStatus: (status) => print("onStatus: $status"),
      onError: (error) => print("onError: $error"),
    );
    print("Speech initialize: $available");
    if (!available) return;
    if (!isListening) {
      print("Speech initialize: $available");

      if (available) {
        isListening = true;
        emit(SpeechListening());

        speech.listen(
          localeId: "en_US",
          onResult: (result) {
            print("RESULT = ${result.recognizedWords}");
            if (activeController != null) {
              activeController!.text = result.recognizedWords;
              activeController!.selection = TextSelection.fromPosition(
                TextPosition(offset: activeController!.text.length),
              );
            }
            emit(SpeechResult(result.recognizedWords));
          },
          listenFor: Duration(minutes: 5),
          pauseFor: Duration(seconds: 5),
          partialResults: true,
          onSoundLevelChange: (level) {},
        );
      }
    } else {
      await speech.stop();
      isListening = false;
      emit(SpeechStopped());
    }
  }

  Future<void> stopRecording() async {
    await speech.stop();
    isListening = false;
    emit(SpeechStopped());
  }
}

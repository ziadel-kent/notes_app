part of 'speech_to_text_cubit.dart';

@immutable
sealed class SpeechState {}

final class SpeechInitial extends SpeechState {}

class SpeechListening extends SpeechState {}

class SpeechStopped extends SpeechState {}

class SpeechResult extends SpeechState {
  final String text;

  SpeechResult(this.text);
}

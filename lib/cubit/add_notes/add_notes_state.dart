part of 'add_notes_cubit.dart';

@immutable
sealed class AddNotesState {}

final class AddNotesInitial extends AddNotesState {}

class AddNotesLoading extends AddNotesState {}

class AddNotesSuccess extends AddNotesState {
    
}

class AddNotesFailure extends AddNotesState {
  final String errrorMsg;
  AddNotesFailure(this.errrorMsg);
}

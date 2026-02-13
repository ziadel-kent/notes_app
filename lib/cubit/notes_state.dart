part of 'notes_cubit.dart';

@immutable
sealed class NotesState {}

class NotesInitial extends NotesState {}

class NotesSuccess extends NotesState {
  List<NotesModel> notesModel;
  NotesSuccess({required this.notesModel});
}

class NotesLoading extends NotesState {}

class NotesFailure extends NotesState {
  final String errorMsg;
  NotesFailure(this.errorMsg);
}

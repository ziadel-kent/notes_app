import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/model/notes_model.dart';

part 'add_notes_state.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(AddNotesInitial());
  addNote(NotesModel note) async {
    emit(AddNotesLoading());
    try {
      var notesBox = Hive.box<NotesModel>(kNotesBox);
      await notesBox.add(note);
      emit(AddNotesSuccess());
    } catch (e) {
      print('add');
      emit(AddNotesFailure(e.toString()));
    }
  }
}

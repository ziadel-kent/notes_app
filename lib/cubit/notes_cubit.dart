import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/model/notes_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  fetchAllNotes() async {
   
    try {
      var notesBox = Hive.box<NotesModel>(kNotesBox);

    //  List<NotesModel> notes=notesBox.values.toList();
      // emit(NotesSuccess(notesModel:  notes));
      emit(NotesSuccess(notesModel:  notesBox.values.toList()));
    } catch (e) {
      print('add');
      emit(NotesFailure(e.toString()));
    }
  }
}

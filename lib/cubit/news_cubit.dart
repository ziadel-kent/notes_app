import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


part 'news_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

}

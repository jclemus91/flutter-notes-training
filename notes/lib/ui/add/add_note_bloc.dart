
import 'package:notes/model/note.dart';
import 'package:notes/repository/note_repository.dart';
import 'package:rxdart/rxdart.dart';

class AddNoteBloc {

  final goBack = PublishSubject<Object>();
  NoteRepository _noteRepository;

  AddNoteBloc(NoteRepository noteRepository) {
    _noteRepository = noteRepository;
  }

  void createNote(String title, String message) {
    _noteRepository.addNote(Note(title, message));
    closeAddNoteScreen();
  }

  void closeAddNoteScreen() {
    goBack.add(Object());
  }

}

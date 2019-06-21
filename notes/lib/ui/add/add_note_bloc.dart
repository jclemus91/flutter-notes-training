
import 'package:notes/model/note.dart';
import 'package:notes/repository/note_repository.dart';

class AddNoteBloc {

  NoteRepository _noteRepository;

  AddNoteBloc(NoteRepository noteRepository) {
    _noteRepository = noteRepository;
  }

  void createNote(String title, String message) {
    _noteRepository.addNote(Note(title, message));
  }
}
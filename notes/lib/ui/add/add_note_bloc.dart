
import 'package:notes/dao/impl/note_dao_impl.dart';
import 'package:notes/dao/note_dao.dart';
import 'package:notes/model/note.dart';
import 'package:notes/repository/note_repository.dart';

final NoteDao _noteDao = NoteDaoImpl();
final NoteRepository noteRepository = NoteRepository(_noteDao);

class AddNoteBloc {

  NoteRepository _noteRepository;

  AddNoteBloc(NoteRepository noteRepository) {
    _noteRepository = noteRepository;
  }

  void createNote(String title, String message) {
    _noteRepository.addNote(Note(title, message));
  }

}
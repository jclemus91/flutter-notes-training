
import 'package:notes/dao/note_dao.dart';
import 'package:notes/model/note.dart';

class NoteRepository {

  NoteDao _noteDao;

  NoteRepository(NoteDao noteDao) {
    _noteDao = noteDao;
  }

  void addNote(Note note) {
    _noteDao.addNote(note);
  }

  List<Note> getNotes() {
    return _noteDao.getNotes();
  }
}
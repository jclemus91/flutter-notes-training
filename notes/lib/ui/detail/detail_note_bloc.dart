import 'package:notes/model/note.dart';
import 'package:notes/repository/note_repository.dart';
import 'package:rxdart/rxdart.dart';

class DetailNoteBloc {
  NoteRepository _noteRepository;

  final noteSubject = BehaviorSubject<Note>();

  DetailNoteBloc(NoteRepository noteRepository) {
    _noteRepository = noteRepository;
  }

  void getNote(int position) {
    noteSubject.add(_noteRepository.getNote(position));
  }
}
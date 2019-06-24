
import 'package:mockito/mockito.dart';
import 'package:notes/repository/note_repository.dart';
import 'package:notes/ui/add/add_note_bloc.dart';
import 'package:test_api/test_api.dart';

class _NoteRepositoryMock extends Mock implements NoteRepository {}

void main() {

  _NoteRepositoryMock _noteRepository;
  AddNoteBloc _addNoteBloc;

  setUp(() {
    _noteRepository = _NoteRepositoryMock();
    _addNoteBloc = AddNoteBloc(_noteRepository);
  });

  test('save and close screen', () {
    _addNoteBloc.goBack.listen((data) {
      expect(data, isInstanceOf<Object>());
    });
    _addNoteBloc.createNote("", "");
  });

}
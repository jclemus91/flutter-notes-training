import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notes/model/note.dart';
import 'package:notes/ui/add/add_note_screen.dart';
import 'package:notes/ui/detail/detail_note.dart';
import 'package:notes/ui/list/notes_bloc.dart';

import '../../main.dart';

class NotesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NotesScreenState();
  }
}

class _NotesScreenState extends State<NotesScreen> {
  final _notesBloc = NotesBloc(noteRepository);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),
      body: StreamBuilder(
          stream: _notesBloc.notesSubject,
          builder: (context, snapshot) {
            List<Note> notes;
            if (snapshot.hasData) {
              notes = snapshot.data;
            }
            if (notes != null && notes.isNotEmpty) {
              return ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, position) {
                  Note note = notes[position];
                  return Card(
                    child: InkWell(
                      onTap: () {
                        _goToDetail(position);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Text("${note.title}"),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Text("NO hay notas");
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNote,
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    _notesBloc.dispose();
    super.dispose();
  }

  void _addNote() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AddNoteScreen();
    }));
  }

  void _goToDetail(int position) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailNoteScreen.withPosition(position)));
  }
}

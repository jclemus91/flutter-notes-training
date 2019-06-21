import 'package:flutter/material.dart';
import 'package:notes/repository/note_repository.dart';
import 'package:notes/ui/list/notes_screen.dart';

import 'dao/impl/note_dao_impl.dart';
import 'dao/note_dao.dart';

void main() => runApp(MyApp());

final NoteDao _noteDao = NoteDaoImpl();
final NoteRepository noteRepository = NoteRepository(_noteDao);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: NotesScreen(),
    );
  }
}


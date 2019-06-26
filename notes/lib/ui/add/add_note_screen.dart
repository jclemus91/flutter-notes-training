import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../main.dart';
import 'add_note_bloc.dart';

class AddNoteScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddNoteState();
  }
}

final _padding = 8.0;

class _AddNoteState extends State<AddNoteScreen> {

  final _addNoteBloc = AddNoteBloc(noteRepository);
  final _titleController = TextEditingController();
  final _messageController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _addNoteBloc
    ..goBack.listen((data) {
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
      ),
      body: SafeArea(
          minimum: EdgeInsets.all(_padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _titleController,
                textInputAction: TextInputAction.next,
                maxLines: 1,
                maxLength: 50,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(hintText: "Title"),
              ),
              SizedBox(
                height: _padding,
              ),
              TextField(
                controller: _messageController,
                decoration: InputDecoration(hintText: "Mensaje"),
              ),
              SizedBox(
                height: _padding,
              ),
              Row(
                children: <Widget>[
                  RaisedButton(child: Text("Cancel"), onPressed: () {
                    _addNoteBloc.closeAddNoteScreen();
                  }),
                  SizedBox(
                    width: _padding,
                  ),
                  RaisedButton(child: Text("Save"), onPressed: () {
                    _addNote(_titleController.text, _messageController.text);
                  }),
                ],
              )
            ],
          )),
    );
  }

  void _addNote(String title, String message) {
    _addNoteBloc.createNote(title, message);

  }

}

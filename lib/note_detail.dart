import 'package:flutter/cupertino.dart';
import 'package:learning_app/database_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'note_class.dart';

import 'package:flutter/material.dart';

class NoteDetail extends StatelessWidget {
  Note note;
  NoteDetail(this.note);
  DatabaseHelper helper = DatabaseHelper();

  TextEditingController stringController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    stringController.text = note.title;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add or Edit STring"),
      ),
      body: Padding(
          padding: EdgeInsets.all(50.0),
          child: ListView(
            children: [
              TextField(
                autocorrect: true,
                controller: stringController,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                 // note.title = stringController.text.toString();
                  _save(context);
                },
                child: Text("Save"),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Update"),
              ),
            ],
          )),
    );
  }

  void updateTitle() {
    note.title = stringController.text.toString();
  }

  void _save(BuildContext context) async {
    updateTitle();
    if (note.id != null) {
      //update
      await helper.updateNote(note);
    } else {
      //insert
      await helper.insertNote(note);
    }
    Navigator.pop(context);
  }
}

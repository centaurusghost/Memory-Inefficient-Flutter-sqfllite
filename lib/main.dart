import 'package:flutter/material.dart';
import 'note_list.dart';

void main(){
  runApp(
    MaterialApp(actions: null,
    debugShowCheckedModeBanner: false,
    home:NoteList(),
    )
  );
}





// void getListObject(DatabaseHelper db) async {
//   var list = await db.getNoteMapList();
//   print(list);
// }

// void setNoteValue(
//     Note n1, TextEditingController stringText, DatabaseHelper db) {
//   var sucess;
//   n1 = Note(stringText.text.toString());
//   print(stringText.text.toString());
//   sucess = db.insertNote(n1);
//   if (sucess == 1) {
//     print("sucessfull insertion");
//   }
// }

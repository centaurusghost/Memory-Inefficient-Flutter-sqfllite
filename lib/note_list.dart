import 'package:flutter/material.dart';
import 'package:learning_app/database_helper.dart';
import 'package:learning_app/note_class.dart';
import 'package:learning_app/note_detail.dart';
import 'package:sqflite/sqflite.dart';

class NoteList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note> noteList=List.empty(growable: true);
  int count = 0;
  @override
  
  Widget build(BuildContext context) {
    updateListView();
    if(noteList==null){
      print("condition always true wtf");
    noteList = List.empty(growable: true);
    updateListView();
    }
   
    return Scaffold(
      appBar: AppBar(
        title: const Text("List of Strings"),
      ),
      body: getNoteListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          updateListView();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NoteDetail(Note(""))),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  ListView getNoteListView() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            title: Text(this.noteList[position].title),
            trailing: GestureDetector(
              child: Icon(
                Icons.delete,
                color: Colors.grey,
              ),
              onTap: () {
                	_delete(context, noteList[position]);
              },
            ),
            onTap: () {
              debugPrint("ListTile Tapped");
              	navigateToDetail(this.noteList[position]);
            },
          ),
        );
      },
    );
  }

void _delete(BuildContext context, Note note)async{
   int result = await databaseHelper.deleteNote(note.id);
   var title = note.title;
   if(result!=0){
    print("delete sucessful of $title");
   }
   else{
    print("Unable to delete");
   }
   updateListView();
}

void updateListView() async{
final Future<Database> dbFuture = databaseHelper.initializeDatabase();
dbFuture.then((database) {
Future<List<Note>> noteListFuture =  databaseHelper.getNoteList();
noteListFuture.then((noteList) {
  setState(() {
    print("set state running");
    this.noteList = noteList;
    this.count = noteList.length;
  });
});
});
 print("updateListView running");

}

void navigateToDetail(Note note){
   Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NoteDetail(note)),
          );
}

}

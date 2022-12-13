import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'note_class.dart';

class DatabaseHelper {
  static var _databaseHelper;
  static var _database;

  static const dbName = 'notes.db';
  static const noteTable = "note_table";
  static const colID = 'id';
  static const colTitle = 'title';

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

//getter for singleton databse
  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  //initializing database
  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + '$dbName';
    var notesDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return notesDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $noteTable($colID INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT)');
  }

  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database db = await this.database;
    var result = await db.query(noteTable, orderBy: '$colID ASC');
    return result;
  }

  Future<int> insertNote(Note note) async {
    Database db = await this.database;
    var result = await db.insert(noteTable, note.toMap());
    return result;
  }

  Future<int> updateNote(Note note) async {
    Database db = await this.database;
    var result = await db.update(noteTable, note.toMap(),
        where: '$colID = ?', whereArgs: [note.id]);

    return result;
  }

  Future<int> deleteNote(int? id) async {
    Database db = await this.database;
    int result = await db.rawDelete('DELETE FROM $noteTable WHERE $colID=$id');
    return result;
  }

//get number of objects in the database
Future<int?> getCount() async{
    Database db = await this.database;
List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) FROM $noteTable');
var result = Sqflite.firstIntValue(x);
return result;
}

Future<List<Note>> getNoteList() async{
  var noteMapList = await getNoteMapList();
  int count = noteMapList.length;
  List<Note> noteList = List.empty(growable: true);
  for(int i=0; i<count; i++){
    noteList.add(Note.fromMapObject(noteMapList[i]));
  }
  return noteList;

}


}

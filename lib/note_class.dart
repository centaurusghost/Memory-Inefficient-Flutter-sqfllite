class Note {
  int? _id;
  var _title;

  Note(this._title);
  Note.withID(this._id, this._title);

  int? get id => _id;
  String get title => _title;

//set title

  set title(String newTitle) {
    this._title = newTitle;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    if (id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;

    return map;
  }

  Note.fromMapObject(Map<String, dynamic> map) {
    this._id=map['id'];
    this._title=map['title'];
  }
  
}

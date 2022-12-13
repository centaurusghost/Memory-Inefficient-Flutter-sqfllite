import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "List View & SQLLite",
      home: Scaffold(
        appBar: AppBar(actions: [],
        title:Text("CRUD STring"),
        ),
        body: getListView(),
      ),
    ),
  );
}

 Widget getListView() {
  
  var listItems =getListELements();
  var listView = ListView.builder(
    itemCount: 120,

    itemBuilder: (context, index){
 return Container(
  child: ListTile(
title: Text(listItems[index]),
    leading: Icon(Icons.people),
    trailing: Icon(Icons.delete),
  ),
    
  );
    }
 
  );
  
  return listView;
}

List<String> getListELements(){
  var items = List<String>.generate(120, (index) => "String $index");
  return items;
}

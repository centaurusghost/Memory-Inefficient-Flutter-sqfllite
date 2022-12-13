import 'package:flutter/material.dart';
import 'route_page_one.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Routine",
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  var stringPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Routing Trainging"),
      ),
      body:  Padding(
        padding:  EdgeInsets.all(50),
        child:  Column(
          children: [
          TextField(
            controller: stringPass,
            
          ),
          ElevatedButton(onPressed: (() {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> RoutePage(stringPass.text.toString())));
          }), 
          child: Icon(Icons.adb))

        ]),
      )
        );
  }
}

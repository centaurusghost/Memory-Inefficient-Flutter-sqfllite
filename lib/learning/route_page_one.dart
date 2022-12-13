import 'package:flutter/material.dart';

class RoutePage extends StatelessWidget{
  var text;

  RoutePage(this.text);

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title:  Text(text),
      ),
      body:  Padding(
        padding:  EdgeInsets.all(50),
        child:  Column(
          children: [
          
          ElevatedButton(onPressed: (() {
              Navigator.pop(context, true);
          }), 
          child: Icon(Icons.adb))

        ]),
      )
        );
  }

}
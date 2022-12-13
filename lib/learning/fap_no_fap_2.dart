import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "I shall master the app now",
      home: TrainingAgain(),
    ),
  );
}

class TrainingAgain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TrainingAgainState();
  }
}

class TrainingAgainState extends State<TrainingAgain> {
  int a = 0;
  double padding = 100.0;
  String relapse_condition = "No-Fap Days";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          title: Padding(
            padding: EdgeInsets.only(left: padding),
            child: Text(
              "Progress",
            ),
          )),
      body: Center(
        child: Column(children: [
          Text(
            "$relapse_condition  $a",
            style: TextStyle(
              fontSize: 25.0,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                a++;
                relapse_condition = "No-Fap Days";
                padding = padding + 5;
              });
            },
            child: Text("No-Fap"),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                a = -1;
                relapse_condition = "Fuck you Fapper";
                padding = padding - 25;
              });
            },
            child: Text("Fapper"),
          ),
        ]),
      ),
    );
  }
}

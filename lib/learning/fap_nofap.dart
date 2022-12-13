import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "I will suceed",
      home: LearningApp()));
}

class LearningApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _countSucess();
  }
}

class _countSucess extends State<LearningApp> {
  int a = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "I will suceed",
          ),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            a++;
          });
        },
        child: const Text(
          "No-Fap",
          style: TextStyle(
            fontSize: 15.0,
          ),
        ),
      ),
      body: Center(
          child: Column(
        children: [
          Text(
            "I have suceed $a number of times",
            style: const TextStyle(color: Colors.cyan, fontSize: 24.0),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                a = a - 7;
              });
            },
            child: const Text("Fap"),
          ),
        ],
      )),
    );
  }
}

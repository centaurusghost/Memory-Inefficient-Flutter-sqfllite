import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Testing how to put image",
      home: ImageLearning(),
    ),
  );
}

class ImageLearning extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ImageLearningState();
  }
}

class ImageLearningState extends State<ImageLearning> {
  String imagepath = 'images/sumit.jpg';
  @override
  Widget build(BuildContext context) {
    //  Image image = Image(image: assetImage);
    return Scaffold(
        appBar: AppBar(
          title: Text(imagepath),
          backgroundColor: Colors.lightBlue,
        ),
        body: Column(
          children: [
            Image(
              image: AssetImage(imagepath),
            ),
            Row(
              children: [
                const Padding(padding: EdgeInsets.only(left: 100)),
                ElevatedButton(
                  onPressed: (() {
                    setState(() {
                      imagepath = 'images/ozone.jpg';
                    });
                  }),
                  child: const Text("Ozone"),
                ),
                const Padding(padding: EdgeInsets.only(left: 75)),
                ElevatedButton(
                  onPressed: (() {
                    setState(() {
                      imagepath = 'images/sumit.jpg';
                    });
                  }),
                  child: const Text("Sumit"),
                ),
              ],
            )
          ],
        ));
  }
}

import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "I shall make this app on fever",
      home: BMICalculator(),
      // theme: ThemeData(scaffoldBackgroundColor: Color.fromARGB(255, 255, 0, 0)),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class BMICalculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BMICalculatorState();
  }
}

class BMICalculatorState extends State<BMICalculator> {
  TextEditingController weight = TextEditingController();
  TextEditingController heightFeet = TextEditingController();
  TextEditingController heightInches = TextEditingController();
  static String healthy_status = "";
  static double BMI = 0.0;

  Color colorTemp = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorTemp,
        appBar: AppBar(
          title: const Text("Your BMI"),
          backgroundColor: Colors.lightBlue,
        ),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.only(
            left: 50.0,
            right: 50.0,
            top: 10.0,
          ),
          child: Center(
              widthFactor: 500,
              heightFactor: 800,
              child: Column(
                children: [
                  Text(
                    "BMI",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextField(
                    controller: weight,
                    maxLength: 3,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.line_weight_outlined,
                          size: 35,
                        ),
                        //  hintText: "Enter Your Weight In Kgs",
                        labelText: "Enter Your Weight In Kgs"),
                  ),
                  TextField(
                    controller: heightFeet,
                    maxLength: 3,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.arrow_upward_outlined,
                          size: 35,
                        ),
                        //  hintText: "Enter Your Weight In Kgs",
                        labelText: "Enter Your height In ft"),
                  ),
                  TextField(
                    controller: heightInches,
                    maxLength: 3,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.arrow_upward_outlined,
                          size: 35,
                        ),
                        //  hintText: "Enter Your Weight In Kgs",
                        labelText: "Enter Your height In Inches"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        calculateBMI();

                        if (BMI >= 18.5 && BMI <= 24.9) {
                          colorTemp = Colors.amber;
                          healthy_status =
                              "You're Healthy  BMI:${BMI.toStringAsFixed(1)}";
                        } else if (BMI < 18.5) {
                          colorTemp = Colors.red;
                          healthy_status =
                              "You're Underweight  BMI:${BMI.toStringAsFixed(1)}";
                        } else {
                          colorTemp = Colors.red;
                          healthy_status =
                              "You're Overweight  BMI:${BMI.toStringAsFixed(1)}";
                        }
                      });
                    },
                    child: const Text("Calculate"),
                  ),
                  SafeArea(
                      child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(healthy_status),
                  ))
                ],
              )),
        )));
  }

  void calculateBMI() {
    int weightTemp = 0, heightFeetTemp = 0, heightInchesTemp = 0;
    weightTemp = int.parse(weight.text);
    heightFeetTemp = int.parse(heightFeet.text);
    heightInchesTemp = int.parse(heightInches.text);

    BMI = weightTemp /
        ((heightFeetTemp * 0.3048 + 0.0254 * heightInchesTemp) *
            (heightFeetTemp * 0.3048 + 0.0254 * heightInchesTemp));
  }
}

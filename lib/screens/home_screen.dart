import 'dart:math';

import 'package:bmi_calculator_application/widgets/background_shape_left.dart';
import 'package:bmi_calculator_application/widgets/background_shape_right.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final weightController = TextEditingController();
  final heightController = TextEditingController();

  double resultBMI = 0;
  String resultText = '';
  double shouldBeWeight = 0;
  double widthGood = 100.0;
  double widthBad = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "BMI CALCULATOR",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130.0,
                  child: TextField(
                    controller: weightController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    autocorrect: false,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Weight",
                      hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 130.0,
                  child: TextField(
                    controller: heightController,
                    keyboardType: TextInputType.number,
                    autocorrect: false,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height",
                      hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            InkWell(
              onTap: () {
                // 168 -> 168.0 : Transform String to double (double.parse())
                final weight = double.parse(weightController.text);
                final height = double.parse(heightController.text);

                setState(() {
                  resultBMI = weight / (height * height);
                  shouldBeWeight = 25.0 * (height * height);
                  print(shouldBeWeight);
                  if (resultBMI > 25) {
                    widthGood = double.infinity - 300;
                    widthBad = 300;
                    resultText = "You're so FAT!";
                  } else if (resultBMI >= 18.5 && resultBMI <= 25.0) {
                    widthGood = 200;
                    widthBad = 200;
                    resultText = "You're in SHAPE, well done!";
                  } else {
                    widthGood = double.infinity - 300;
                    widthBad = 300;
                    resultText =
                        "OMG! Someone give you some food! Where is UNICEF?!";
                  }
                });
              },
              child: Text(
                "Calculate",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 40),
            Text(
              "${resultBMI.toStringAsFixed(2)}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 64),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Text(
                resultText,
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 300,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Ideal Weight:",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.white),
                    child: Center(
                      child: Text(
                        "${shouldBeWeight.toStringAsFixed(2)}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 28),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 40),
            RightShape(width: widthBad),
            SizedBox(height: 15),
            LeftShape(width: widthGood),
          ],
        ),
      ),
    );
  }
}

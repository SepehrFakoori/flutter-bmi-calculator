import 'package:flutter/material.dart';
import 'package:bmi_calculator_application/screens/home_screen.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "dana"),
      home: HomeScreen(),
    );
  }
}

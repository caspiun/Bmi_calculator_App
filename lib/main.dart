import 'package:flutter/material.dart';
import 'inputpage.dart';
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0a0e21),
          elevation: 5.0,
          shadowColor: Colors.black87,
        ),
        primaryColor: const Color(0xFF0A0E21),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFF101427),
        ),

        scaffoldBackgroundColor: const Color(0xFF0A0E21),
        textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white)),
      ),
      home:  InputPage(),
    );
  }
}



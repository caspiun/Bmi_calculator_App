import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});

  int? height;
  int? weight;
  double? _bmi;

  String calculateBMI() {
    if (height == null || height == 0 || weight == null || weight == 0) {
      return "Invalid input"; // Handle invalid input
    }

    _bmi = weight! / pow(height! / 100, 2);
    return _bmi!.toStringAsFixed(1);
  }

  String getresult() {
    if (_bmi == null) {
      return "Invalid BMI"; // Handle the case when BMI is not calculated
    }

    if (_bmi! >= 25) {
      return 'Overweight';
    } else if (_bmi! > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getinterpret() {
    if (_bmi == null) {
      return "Invalid BMI"; // Handle the case when BMI is not calculated
    }

    if (_bmi! >= 25) {
      return 'Bhai samikshya jaisa hojayega khane pe control kr';
    } else if (_bmi! > 18.5) {
      return 'Hot like yash';
    } else {
      return '11th wala prince ho jayega bhai dhyan rakh';
    }
  }
}

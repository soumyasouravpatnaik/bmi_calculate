import 'dart:math';

import 'package:flutter/material.dart';
class CalculatorFunction{
  CalculatorFunction({this.weight, this.height});
  final int weight;
  final int height;
  double _bmi;
  String CalculateBMI(){
    _bmi = weight/pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }
  String getResult(){
    if (_bmi >=25) {
      return 'Overweight';
    }
    else if (_bmi > 18.5){
      return 'Normal';
    }
    else{
      return 'Underweight';
    }
  }
  String getInterpretations(){
    if (_bmi >=25)
      return 'Cut down your calories';
    else if (_bmi > 18.5)
      return 'Consume same calories';
    else
      return 'Increase your calories';
  }
}
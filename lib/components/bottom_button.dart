import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({this.ButtonName, this.onTap});
  final Function onTap;
  final String ButtonName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottombutton,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: 80.0,
        child: Center(
            child: Text(
              ButtonName,
              style: TextStyle(color: Colors.white, fontSize: 40),
            )),
      ),
    );
  }
}
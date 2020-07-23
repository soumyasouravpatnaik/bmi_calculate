import 'package:flutter/material.dart';


class ReusableComponent extends StatelessWidget {
  ReusableComponent({@required this.colour, this.CardChild, this.onPress});
  final Color colour;
  final Widget CardChild;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: CardChild,
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(10.0)
        ),
      ),
    );
  }
}
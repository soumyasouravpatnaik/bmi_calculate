import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/input_page.dart';
import 'package:flutter/material.dart';
import '../components/reusable_content.dart';
class Results extends StatelessWidget {
  Results({@required this.bmiResult, @required this.bmiResultText, @required this.Interpretation});
  final String bmiResult;
  final String bmiResultText;
  final String Interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
          'Results',
        ),
        ),
        body:

        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: Text(
                'Your Result', style: kTitleTextStyle,
              )
              )
            ),
            Expanded(
              flex: 5,
              child: ReusableComponent(
                colour: kActiveColor,
                CardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: <Widget>[
                    Text(
                        bmiResultText.toString(), style: kResultTextStyle
                    ),
                    Text(
                      bmiResult, style: kBMITextStyle,
                    ),
                    Text(
                      Interpretation.toString(), style: kBMIDescTextStyle,
                    )
                  ],
                ),
              ),
            ),
            BottomButton(ButtonName: 'RE-CALCULATE', onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => InputPage()));
            },
            )
          ],
        ),
      );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_content.dart';
import '../constants.dart';
import '../screens/results_page.dart';
import '../components/round_icon_button.dart';
import '../components/bottom_button.dart';
import '../components/calculator_function.dart';

enum gender { male, female }
gender selectedGender;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 150;
  int weight = 50;
  int age = 25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
        ),
        body: Column(children: <Widget>[
          Expanded(
              child: Row(children: <Widget>[
            Expanded(
              child: ReusableComponent(
                onPress: () {
                  setState(() {
                    selectedGender = gender.male;
                  });
                },
                colour: selectedGender == gender.male
                    ? kActiveColor
                    : kInactiveColor,
                CardChild: IconContent(
                  icon: FontAwesomeIcons.male,
                  label: 'MALE',
                ),
              ),
            ),
            Expanded(
              child: ReusableComponent(
                onPress: () {
                  setState(() {
                    selectedGender = gender.female;
                  });
                },
                colour: selectedGender == gender.female
                    ? kActiveColor
                    : kInactiveColor,
                CardChild: IconContent(
                  icon: FontAwesomeIcons.female,
                  label: 'FEMALE',
                ),
              ),
            ),
          ])),
          Expanded(
              child: ReusableComponent(
            colour: kActiveColor,
            CardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('HEIGHT', style: kLabelTextStyle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(height.toString(),
                        style: kLabelBoldTextStyle),
                    Text('cm', style: kLabelTextStyle),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x1FEB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.white54),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                )
              ],
            ),
          )),
          Expanded(
              child: Row(
                  children: <Widget>[
                  Expanded(
                      child: ReusableComponent(
                          CardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'WEIGHT', style: kLabelTextStyle
                              ),
                              Text(
                                  weight.toString(), style: kLabelBoldTextStyle
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  RoundIconButton(icon: FontAwesomeIcons.minus, onPress: (){
                                    setState(() {
                                      weight--;
                                    });
                                  }, ),
                                  SizedBox(width: 15),
                                  RoundIconButton(icon: FontAwesomeIcons.plus, onPress: (){
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  ),
                                ],
                              )
                            ],
                          ),
                          colour: kActiveColor),
                  ),
                  Expanded(
                      child: ReusableComponent(
                          CardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                  'AGE', style: kLabelTextStyle
                              ),
                              Text(
                                  age.toString(), style: kLabelBoldTextStyle
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  RoundIconButton(icon: FontAwesomeIcons.minus, onPress: (){
                                    setState(() {
                                      age--;
                                    });
                                  }, ),
                                  SizedBox(width: 15),
                                  RoundIconButton(icon: FontAwesomeIcons.plus, onPress: (){
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  ),
                                ],
                              )
                            ],
                          ),
                          colour: kActiveColor),
                  ),
            ],
          )
          ),
          BottomButton(ButtonName: 'CALCULATE', onTap: (){
            CalculatorFunction calc = CalculatorFunction(weight: weight, height: height);
            Navigator.push(context, MaterialPageRoute(builder: (context) => Results(
                bmiResult: calc.CalculateBMI(),
                bmiResultText: calc.getResult(),
                Interpretation: calc.getInterpretations()
            ),
            ),
            );
          },)
        ]));
  }
}




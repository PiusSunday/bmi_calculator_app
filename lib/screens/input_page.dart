import 'package:bmi_calculator_app/classes/calculator_brain.dart';
import 'package:bmi_calculator_app/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../classes/bottom_button.dart';
import '../classes/card_child.dart';
import '../classes/reusable_card.dart';
import '../classes/round_icon_button.dart';
import '../constants/constants.dart';

// AN ENUMERATION OF THE GENDER TYPES
enum Gender {
  male,
  female,
}

class BMICalculatorPage extends StatefulWidget {
  const BMICalculatorPage({Key? key}) : super(key: key);

  @override
  State<BMICalculatorPage> createState() => _BMICalculatorPage();
}

class _BMICalculatorPage extends State<BMICalculatorPage> {
  // GENDER STARTS AS A NULL VALUE
  Gender? selectedGender;

  // DEFAULT INITIAL HEIGHT VALUE
  int height = 180;

  // DEFAULT INITIAL WEIGHT VALUE
  int weight = 60;

  // DEFAULT INITIAL AGE VALUE
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Row(
            children: [
              // MALE CARD
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  // Since our card starts as a false, it gets the inactiveCardColor true only if the card gets tapped then it gets the activeCardColor
                  mycolor: selectedGender == Gender.male
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: const CardChildWidget(
                      icon: FontAwesomeIcons.mars, text: "MALE"),
                ),
              ),

              // FEMALE CARD
              Expanded(
                child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    // Since our card starts as a false, it gets the inactiveCardColor true only if the card gets tapped then it gets the activeCardColor
                    mycolor: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: const CardChildWidget(
                        icon: FontAwesomeIcons.venus, text: "FEMALE")),
              ),
            ],
          ),
        ),

        // CENTER CARD
        Expanded(
          child: ReusableCard(
            mycolor: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("HEIGHT", style: kTextStyle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(height.toString(), style: kNumberTextStyle),
                    const Text("cm", style: kTextStyle),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: const Color(0xFF8D8E98),
                    activeTrackColor: Colors.white,
                    thumbColor: const Color(0xFFEB1555),
                    overlayColor: const Color(0x29EB1555),
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
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
                ),
              ],
            ),
          ),
        ),

        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  mycolor: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "WEIGHT",
                        style: kTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          const SizedBox(width: 10.0),
                          RoundedIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  mycolor: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "AGE",
                        style: kTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          const SizedBox(width: 10.0),
                          RoundedIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        BottomButton(
          buttonTitle: "CALCULATE",
          onTap: () {

            CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);


            return Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultsPage(
                  bmiResult: calc.calculateBMI(),
                  resultText: calc.getResult(),
                  interpretation: calc.getInterpretation(),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

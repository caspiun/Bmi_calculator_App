import 'package:flutter/material.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'results.dart';
import 'constants.dart';
import 'calculatorbrain.dart';

int height = 180;
int weight = 60;
int age = 20;

enum genders { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

Color mcolor = kicolor;
Color wcolor = kicolor;
void updatecolor(genders i) {
  mcolor =
      (i == genders.male) ? ((mcolor == kicolor) ? kacolor : kicolor) : mcolor;
  wcolor = (i == genders.female)
      ? ((wcolor == kicolor) ? kacolor : kicolor)
      : wcolor;
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableWidget(
                    clr: () {
                      setState(() {
                        updatecolor(genders.male);
                      });
                    },
                    colour: mcolor,
                    cardchild: Exwidget(
                      pic: Icons.male_outlined,
                      txt: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableWidget(
                    clr: () {
                      setState(() {
                        updatecolor(genders.female);
                      });
                    },
                    colour: wcolor,
                    cardchild: Exwidget(
                      pic: Icons.female_outlined,
                      txt: 'FEMALE',
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableWidget(
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: TextStyle(fontSize: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: ksst),
                      Text(
                        'cm',
                        style: ksst,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0XFFEB1555),
                      inactiveTrackColor: Colors.grey,
                      overlayColor: Color(0xFFEB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (double newvalue) {
                        setState(() {
                          height = newvalue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
              colour: kacolor,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableWidget(
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: TextStyle(fontSize: 25),
                        ),
                        Text(
                          weight.toString(),
                          style: TextStyle(fontSize: 35),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconbutton(
                                icon: Icons.remove_circle_outline,
                                rtn: () {
                                  setState(() {
                                    weight = weight - 1;
                                  });
                                }),
                            SizedBox(
                              width: 20.0,
                            ),
                            RoundIconbutton(
                              icon: Icons.add_box_sharp,
                              rtn: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    colour: kacolor,
                  ),
                ),
                Expanded(
                  child: ReusableWidget(
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: TextStyle(fontSize: 25.0),
                        ),
                        Text(
                          age.toString(),
                          style: TextStyle(fontSize: 35.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconbutton(
                              icon: Icons.remove_circle,
                              rtn: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            RoundIconbutton(
                              icon: Icons.add_box_outlined,
                              rtn: () {
                                setState(() {
                                  age++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                    colour: kacolor,
                  ),
                )
              ],
            ),
          ),
          Bottom(
            ontap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Result(
                resulttext: calc.getresult(),
                bmiresult: calc.calculateBMI(),
                interpret: calc.getinterpret(),
              )));
            },
            txt: 'CALCULATE',
          )
        ],
      ),
    );
  }
}

class Bottom extends StatelessWidget {
  const Bottom({
    this.ontap,
    this.txt,
  });
  final VoidCallback? ontap;
  final String? txt;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: Center(
            child: Text(
          txt ?? '',
          style: klarge,
        )),
        color: Colors.pinkAccent,
        padding: EdgeInsets.only(bottom: 20.0),
        margin: EdgeInsets.only(top: 10.0),
        height: 80.0,
        width: double.infinity,
      ),
    );
  }
}

class RoundIconbutton extends StatelessWidget {
  const RoundIconbutton({super.key, this.icon, required this.rtn});
  final IconData? icon;
  final VoidCallback rtn;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: rtn,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}

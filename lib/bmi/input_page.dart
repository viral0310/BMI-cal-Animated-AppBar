import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../custom widget/custom app bar.dart';
import 'enum_file.dart';
import 'formula.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> _animation;
  Gender selectedCard = Gender.n;
  Color fc1 = Colors.white; // fontColor
  Color sc1 = const Color(0xffeb1555); // change font color
  Color fc2 = Colors.white;
  Color sc2 = const Color(0xffeb1555);

  int weight = 50;
  int age = 30;

  Color boff1 = const Color(0xff4c4f5e); // button off hoy tyare
  Color bpress1 = const Color(0xff6e6f7a); // button press kariye tyare

  Color boff2 = const Color(0xff4c4f5e);
  Color bpress2 = const Color(0xff6e6f7a);

  Color boff3 = const Color(0xff4c4f5e);
  Color bpress3 = const Color(0xff6e6f7a);

  Color boff4 = const Color(0xff4c4f5e);
  Color bpress4 = const Color(0xff6e6f7a);

  Color ioff1 = Colors.white;
  Color ipress1 = const Color(0xffeb1555);

  Color ioff2 = Colors.white;
  Color ipress2 = const Color(0xffeb1555);

  Color ioff3 = Colors.white;
  Color ipress3 = const Color(0xffeb1555);

  Color ioff4 = Colors.white;
  Color ipress4 = const Color(0xffeb1555);
  double sliderVal = 156;
  double height = 113.0;
  Logic logic = Logic();
  double bmiResult = 0;
  int h = 0;
  int w = 0;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _animation = Tween<Offset>(
      begin: const Offset(-1, 0.0),
      end: const Offset(0.5, 0.0),
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInCubic,
    ));

    Timer(const Duration(microseconds: 1), () {
      if (height == 113) {
        setState(() {
          height = 200.0;
        });
      } else {
        setState(() {
          height = 113.0;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Container(
        color: const Color(0xff090e21),
        child: Column(
          children: [
            CustomAppBar(height + statusBarHeight, 'BMI Calculator'),

// first row
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCard = Gender.female;
                          fc2 = Colors.white;
                          fc1 = sc1;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: selectedCard == Gender.female
                              ? const Color(0xff3b3c4c)
                              : const Color(0xff1d1e33),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.venus,
                              size: 100,
                              color: fc1,
                            ),
                            const SizedBox(height: 15),
                            Text("Female",
                                style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: fc1,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCard = Gender.male;
                          fc2 = sc2;
                          fc1 = Colors.white;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: selectedCard == Gender.male
                              ? const Color(0xff3b3c4c)
                              : const Color(0xff1d1e33),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.mars,
                              size: 100,
                              color: fc2,
                            ),
                            const SizedBox(height: 15),
                            Text("Male",
                                style: TextStyle(
//fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: fc2,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
//second row
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xff1d1e33),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "HEIGHT",
                            style: TextStyle(
                              fontSize: 21,
                              color: Color(0xff626473),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "${sliderVal.toInt()}",
                                style: const TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: const Text(
                                  " cm",
                                  style: TextStyle(
                                    fontSize: 21,
                                    color: Color(0xff626473),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Slider(
                            value: sliderVal,
                            min: 120.0,
                            max: 225.0,
                            onChanged: (val) {
                              setState(() {
                                sliderVal = val;
                              });
                            },
                            inactiveColor: const Color(0xff555555),
                            activeColor: const Color(0xfff5c1d1),
                            thumbColor: const Color(0xffeb1555),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
//3rd row
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xff1d1e33),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Weight",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "$weight",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 60,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    weight--;
                                    boff1 = bpress1;
                                    boff2 = const Color(0xff4c4f5e);
                                    ioff1 = ipress1;
                                    ioff2 = Colors.white;
                                  });
                                },
                                child: CircleAvatar(
                                  backgroundColor: boff1,
                                  radius: 28,
                                  child: Icon(
                                    FontAwesomeIcons.minus,
                                    color: ioff1,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    weight++;
                                    boff2 = bpress2;
                                    boff1 = const Color(0xff4c4f5e);
                                    ioff2 = ipress2;
                                    ioff1 = Colors.white;
                                  });
                                },
                                child: CircleAvatar(
                                  backgroundColor: boff2,
                                  radius: 28,
                                  child: Icon(
                                    FontAwesomeIcons.plus,
                                    color: ioff2,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xff1d1e33),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Age",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "$age",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 60,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    age--;
                                    boff3 = bpress3;
                                    boff4 = const Color(0xff4c4f5e);
                                    ioff3 = ipress3;
                                    ioff4 = Colors.white;
                                  });
                                },
                                child: CircleAvatar(
                                  backgroundColor: boff3,
                                  radius: 28,
                                  child: Icon(
                                    FontAwesomeIcons.minus,
                                    color: ioff3,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    age++;
                                    boff4 = bpress4;
                                    boff3 = const Color(0xff4c4f5e);
                                    ioff4 = ipress4;
                                    ioff3 = Colors.white;
                                  });
                                },
                                child: CircleAvatar(
                                  backgroundColor: boff4,
                                  radius: 28,
                                  child: Icon(
                                    FontAwesomeIcons.plus,
                                    color: ioff4,
                                  ),
                                ),
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
// button
            GestureDetector(
              onTap: () {
                if (height == 113) {
                  setState(() {
                    height = 200.0;
                  });
                } else {
                  setState(() {
                    height = 113.0;
                  });
                }

                h = sliderVal.toInt();
                w = weight;
                setState(() {
                  bmiResult = logic.calculateBMI(h, w);
                });
                animationController.repeat();

                print(h);
              },
              child: Container(
                height: 50,
                padding: const EdgeInsets.only(left: 80, right: 80),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: const Color(0xffeb1555),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Result",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    (h == 0 && w == 0)
                        ? const Text("")
                        : Row(
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                height: 500,
                                alignment: Alignment.topCenter,
                                child: SlideTransition(
                                  position: _animation,
                                  child: const Text(
                                    "→",
                                    style: TextStyle(
                                        color: Color(0xff1d1e33),
                                        fontWeight: FontWeight.w900,
                                        fontSize: 35),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                "${bmiResult.toStringAsFixed(2)}",
                                style: const TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

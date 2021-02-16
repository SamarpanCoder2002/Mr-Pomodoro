import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:async';
import 'dart:io';

class PromoDoroClock extends StatefulWidget {
  double wTime, bTime;

  PromoDoroClock(this.wTime, this.bTime);

  @override
  State<StatefulWidget> createState() {
    return PromoDoro(this.wTime.toInt(), this.bTime.toInt());
  }
}

class PromoDoro extends State<PromoDoroClock> {
  int wTime, bTime, animationTiming;
  double percentCompleteness = 0.0;
  bool _startTimerEnabled = true, _resetEnabled = false;
  String timerCounter = "Sleep Mode";


  PromoDoro(this.wTime, this.bTime);

  @override
  void initState() {
    super.initState();
    animationTiming = 500;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          color: Colors.blueAccent,
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 40.0,
                ),
                alignment: Alignment.center,
                child: Text(
                  "PromoDoro Counter",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                    fontFamily: 'Lora',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              circularProgress(),
              SizedBox(height: 40.0),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(
                    top: 30.0,
                    left: 15.0,
                    right: 15.0,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40.0),
                      topLeft: Radius.circular(40.0),
                    ),
                  ),
                  child: ListView(
                    children: [
                      Row(
                        children: [
                          denoting("Working Time", this.wTime, 1),
                          SizedBox(
                            width: 20.0,
                          ),
                          denoting("Break Time", this.bTime, 0),
                        ],
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      instructionalButton(1),
                      SizedBox(
                        height: 35.0,
                      ),
                      instructionalButton(0),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget circularProgress() {
    return CircularPercentIndicator(
      radius: 280.0,
      animation: true,
      animationDuration: animationTiming,
      lineWidth: 20.0,
      percent: percentCompleteness,
      center: Text(
        '$timerCounter',
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 30.0, color: Colors.white),
      ),
      circularStrokeCap: CircularStrokeCap.round,
      backgroundColor: Colors.white,
      linearGradient: LinearGradient(
          transform: GradientRotation(150),
          colors: [Colors.redAccent, Colors.lightGreenAccent]),
    );
  }


  Widget denoting(String primaryFont, int timeLimit, int firstPortion) {
    double moderateFontSize = 28.0, leftPadding = 10.0;
    if (firstPortion == 1) {
      moderateFontSize = 25.0;
      leftPadding = 6.0;
    }
    return Expanded(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: leftPadding),
            child: Text(
              primaryFont,
              style: TextStyle(
                fontSize: moderateFontSize,
                fontFamily: 'Lora',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20.0),
            child: Text(
              "$timeLimit min",
              style: TextStyle(fontSize: 40.0, fontFamily: 'Lora'),
            ),
          ),
        ],
      ),
    );
  }

  Widget instructionalButton(int functionality) {
    String instruction = "Reset", debugShow = "Reset Button Pressed";
    double moderateFontSize = 23.0;
    if (functionality == 1) {
      instruction = "Start Timer";
      moderateFontSize = 25.0;
      debugShow = "Start Time Button Timer";
      return timerConfiguration(instruction, moderateFontSize);
    } else
      return resetConfiguration(instruction, moderateFontSize);
  }

  Widget timerConfiguration(String instruction, double moderateFontSize) {
    return Center(
        child: RaisedButton(
      elevation: 15.0,
      padding: EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(
            width: 1.0,
          )),
      color: Colors.blue,
      child: Text(
        instruction,
        style: TextStyle(
          fontSize: moderateFontSize,
          fontFamily: 'Lora',
          color: Colors.white,
        ),
      ),
      onPressed: () {
        setState(() {
            if (_startTimerEnabled == true) {
              timerCounter = "Timer Running";
              _startTimerEnabled = false;
              _resetEnabled = true;
              Future<double> take = stateChange();
              take.then((value) {
                animationTiming = this.wTime * 1000;
                percentCompleteness = 1.0;
              });
            }
          },
        );
      },
    ));
  }

  Widget resetConfiguration(String instruction, double moderateFontSize) {
    return Center(
      child: RaisedButton(
        elevation: 15.0,
        padding: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(
              width: 1.0,
            )),
        color: Colors.blue,
        child: Text(
          instruction,
          style: TextStyle(
            fontSize: moderateFontSize,
            fontFamily: 'Lora',
            color: Colors.white,
          ),
        ),
        onPressed: () {
          setState(() {
            if (_resetEnabled == true) {
              timerCounter = "Sleep Mode";
              _resetEnabled = false;
              _startTimerEnabled = true;
              Future<double> take = stateChange();
              take.then((value) {
                animationTiming = 0;
                percentCompleteness = 0.0;
              });
            }
          });
        },
      ),
    );
  }

  Future<double> stateChange() {
    Future<double> result = Future.delayed(Duration(seconds: 0), () => 1.0);
    return result;
  }
}
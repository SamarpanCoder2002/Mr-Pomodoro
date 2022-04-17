import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class PointsOrValuesShowOnScreen extends StatelessWidget {
  int _userAchieve;
  int _duration = 0;
  String _achieveType;
  String _header = "";
  double sizeFont = 0.0;

  PointsOrValuesShowOnScreen(this._userAchieve, [this._achieveType = "Points"]);

  void initialize() {
    if (this._userAchieve <= 10)
      this._duration = 1;
    else if (this._userAchieve <= 20)
      this._duration = 2;
    else if (this._userAchieve <= 50)
      this._duration = 3;
    else if (this._userAchieve <= 100)
      this._duration = 5;
    else if (this._userAchieve <= 1000)
      this._duration = 7;
    else if (this._userAchieve <= 5000)
      this._duration = 13;
    else
      this._duration = 15;
    if (this._achieveType == "Points") {
      _header = "Points Earned";
      sizeFont = 30.0;
    } else {
      _header = "Levels Achieved";
      sizeFont = 30.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    initialize();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height / 4,
                child: Text(
                  this._header,
                  style: TextStyle(
                    fontSize: sizeFont,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff1dba18),
                    letterSpacing: 1.0,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: CircularCountDownTimer(
                  duration: _duration,
                  initialDuration: 0,
                  width: MediaQuery.of(context).size.width - 60,
                  height: MediaQuery.of(context).size.height,
                  ringColor: Colors.white,
                  ringGradient: null,
                  fillColor: Colors.orange,
                  fillGradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [
                        Color(0xff1cc916),
                        Color(0xff3bfa34),
                      ]),
                  strokeWidth: 25.0,
                  strokeCap: StrokeCap.round,
                  isTimerTextShown: false,
                  autoStart: true,
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(this._userAchieve.toString(),
                    style: TextStyle(
                      fontSize: 90.0,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff1dba18),
                    )),

                // Countup(
                //   begin: 0.0,
                //   end: this._userAchieve.toDouble(),
                //   duration: Duration(seconds: _duration),
                //   style: TextStyle(
                //     fontSize: 90.0,
                //
                //     fontWeight: FontWeight.w700,
                //     color: Colors.lightGreenAccent,
                //   ),
                //   curve: Curves.easeInQuad,
                //   textAlign: TextAlign.justify,
                //   softWrap: true,
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

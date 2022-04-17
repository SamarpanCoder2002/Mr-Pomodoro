import 'package:flutter/material.dart';

class PomoDoroSumUp extends StatelessWidget {
  List _storeValueTake = [];

  PomoDoroSumUp(this._storeValueTake);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              heading(context),
              upperText(context),
              pomoDoroData(context, "Pomodoro 1", this._storeValueTake[0]),
              pomoDoroData(context, "Pomodoro 2", this._storeValueTake[1]),
              pomoDoroData(context, "Pomodoro 3", this._storeValueTake[2]),
              pomoDoroData(context, "Pomodoro 4", this._storeValueTake[3]),
              SizedBox(
                height: 20.0,
              ),
              pomoDoroData(context, "Total Pomodoro", this._storeValueTake[4]),
              footerText(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget heading(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 12,
      alignment: Alignment.bottomCenter,
      child: Text(
        "Pomodoro Result",
        style: TextStyle(
          fontSize: 30.0,
          color: Color(0xff1dba18),
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }

  Widget upperText(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
          top: 20.0,
        ),
        height: MediaQuery.of(context).size.height / 10,
        child: Row(children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "Pomodoro Name",
                style: TextStyle(fontSize: 20.0, color: Color(0xff6d6e75)),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "Frequency",
                style: TextStyle(fontSize: 20.0, color: Color(0xff6d6e75)),
              ),
            ),
          )
        ]));
  }

  Widget pomoDoroData(
      BuildContext context, String pomoDoroName, int frequency) {
    return Container(
      height: MediaQuery.of(context).size.height / 10,
      alignment: Alignment.center,
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                pomoDoroName,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Color(0xff6d6e75),
                  letterSpacing: 1.0,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                frequency.toString(),
                style: TextStyle(fontSize: 18.0, color: Color(0xff6d6e75)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget footerText(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * (1.5 / 8),
      alignment: Alignment.center,
      child: Text(
        "Hope You Enjoy It",
        style: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.italic,
          color: Color(0xff1dba18),
          letterSpacing: 1.0,
        ),
      ),
    );
  }
}

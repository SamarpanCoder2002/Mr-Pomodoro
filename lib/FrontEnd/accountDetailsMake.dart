import 'package:flutter/material.dart';
import 'package:hello_promodoro/FrontEnd/DetailsEdit.dart';

class AccountInformation extends StatelessWidget {
  List _takeInformation;
  String _userName;

  AccountInformation(this._userName, this._takeInformation);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: makeAllChild(context),
    );
  }

  Widget makeAllChild(BuildContext context) {
    return SafeArea(
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(children: <Widget>[
                heading(context),
                propertyReturn(
                    context, "User Name", this._takeInformation[0], 16.0, 14.0),
                propertyReturn(
                    context, "Password", this._takeInformation[1], 16.0, 14.0),
                propertyReturn(context, "Points Earned",
                    this._takeInformation[2].toString(), 16.0, 14.0),
                propertyReturn(context, "Levels Achieved",
                    this._takeInformation[3].toString(), 16.0, 14.0),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    editButton(context, "Edit Details"),
                    editButton(context, "Exit"),
                  ],
                ),
                footerText(context),
              ]),
            )));
  }

  Widget heading(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 30.0,
        bottom: 10.0,
      ),
      //color: Colors.blue,
      alignment: Alignment.center,
      child: Text(
        "Your Details Here",
        style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
            color: Color(0xff1dba18)),
      ),
    );
  }

  Widget propertyReturn(
      BuildContext context, String leftString, String rightString,
      [double firstPortion = 14.0,
      double secondPortion = 14.0,
      Color firstPortionColor = Colors.white,
      Color secondPortionColor = Colors.lightGreenAccent]) {
    int _ind;
    try {
      int.parse(rightString);
      _ind = 0;
    } catch (e) {
      _ind = 1;
    }

    return Container(
      //color: Colors.brown,
      alignment: Alignment.bottomCenter,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 10,
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                leftString,
                style: TextStyle(
                    fontSize: firstPortion,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff6d6e75)),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child:
                  preView(_ind, rightString, secondPortionColor, secondPortion),
            ),
          ),
        ],
      ),
    );
  }

  dynamic preView(int ind, String rightString, Color secondPortionColor,
      double secondFontSize) {
    if (ind == 1) {
      return Text(
        rightString,
        style: TextStyle(
            fontSize: secondFontSize,
            fontWeight: FontWeight.w700,
            color: Color(0xff1dba18)),
      );
    } else {
      return Text(
        rightString,
        style: TextStyle(
            fontSize: secondFontSize,
            fontWeight: FontWeight.w700,
            color: Color(0xff1dba18)),
      );
    }
  }

  Widget editButton(BuildContext context, String buttonText) {
    return SizedBox(
      width: 150,
      child: TextButton(
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Color(0xff1dba18)),
                borderRadius: BorderRadius.circular(8))),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 16.0, color: Color(0xff1dba18)),
        ),
        onPressed: () {
          if (buttonText == "Exit")
            Navigator.pop(context);
          else {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EditDetails(this._userName)));
          }
        },
      ),
    );
  }

  Widget footerText(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 50.0,
      ),
      //color: Colors.brown,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 8,
      alignment: Alignment.center,
      child: Text(
        "Hope You Enjoy It",
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.italic,
          color: Color(0xff1dba18),
          letterSpacing: 1.0,
        ),
      ),
    );
  }
}

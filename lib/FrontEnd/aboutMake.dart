import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(
            Icons.keyboard_backspace_outlined,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Account Details",
          style: TextStyle(
            fontSize: 23.0,
            fontFamily: 'Lora',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: makeAllChild(context),
    );
  }

  Widget makeAllChild(BuildContext context) {
    return SafeArea(
        child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.pinkAccent,
                Colors.blueAccent,
                Colors.purpleAccent,
                Colors.redAccent
              ],
            )),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView(children: <Widget>[
              heading(context),
              propertyReturn(
                  context, "User Name", "Samarpan Dasgupta", 20.0, 20.0),
              propertyReturn(context, "Password", "sam", 20.0, 25.0),
              propertyReturn(context, "Points Earned", "30", 20.0, 25.0),
              propertyReturn(context, "Levels Achieved", "20", 20.0, 25.0),
              Row(
                children: [
                  Expanded(
                    child: editButton(context),
                  ),
                  Expanded(
                    child: editButton(context),
                  ),
                ],
              ),
              footerText(context),
            ])));
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
            fontSize: 30.0,
            fontFamily: 'Lora',
            fontWeight: FontWeight.w700,
            color: Colors.yellow),
      ),
    );
  }

  Widget propertyReturn(
      BuildContext context, String leftString, String rightString,
      [double firstPortion = 18.0,
      double secondPortion = 18.0,
      Color firstPortionColor = Colors.white,
      Color secondPortionColor = Colors.lightGreenAccent]) {
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
                  fontFamily: 'Lora',
                  fontWeight: FontWeight.w700,
                  color: firstPortionColor,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                rightString,
                style: TextStyle(
                  fontSize: secondPortion,
                  fontFamily: 'Lora',
                  fontWeight: FontWeight.w700,
                  color: secondPortionColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget editButton(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 10,
      alignment: Alignment.bottomCenter,
      //color: Colors.brown,
      child: RaisedButton(
        padding: EdgeInsets.only(
          left: 10.0,
          right: 10.0,
          top: 5.0,
          bottom: 7.0,
        ),
        color: Colors.blueAccent,
        elevation: 20.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(
              width: 1.0,
            )),
        child: Text(
          "Edit Details",
          style: TextStyle(
            fontSize: 25.0,
            fontFamily: 'Lora',
            color: Colors.white,
          ),
        ),
        onPressed: () {},
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
          fontSize: 30.0,
          fontFamily: 'Lora',
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.italic,
          color: Colors.yellowAccent,
          letterSpacing: 1.0,
        ),
      ),
    );
  }
}

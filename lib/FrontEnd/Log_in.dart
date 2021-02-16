import 'package:page_transition/page_transition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_promodoro/FrontEnd/Sign_up.dart';
import 'package:hello_promodoro/FrontEnd/Main_Screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class AccountManagerLogIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AccountCreate();
  }
}

class AccountCreate extends State<AccountManagerLogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          leading: Icon(Icons.login),
          actions: [
            Container(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  child: Icon(
                    Icons.account_tree,
                    size: 30.0,
                    color: Colors.lightGreenAccent,
                  ),
                  onTap: () {
                    debugPrint("Sign-Up Button Pressed");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AccountManagerSignUp()));
                  },
                ))
          ],
          title: Text(
            "Log-in",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28.0,
              fontFamily: 'Lora',
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        body: Form(
          child: ListView(
            children: [
              SizedBox(height: 20.0),
              inputTake("name"),
              SizedBox(height: 20.0),
              inputTake(),
              SizedBox(height: 40.0),
              buttons(),
            ],
          ),
        ));
  }

  Widget inputTake([String indicator = "other"]) {
    String labelValue = "", hintValue = "";
    bool permission;
    indicator == "name"
        ? labelValue = "Enter Your Name"
        : labelValue = "Enter Your Password";
    indicator == "name"
        ? hintValue = "e.g: Samarpan Dasgupta"
        : hintValue = "e.g: sam1246";
    indicator == "name" ? permission = false : permission = true;
    return Container(
      margin: EdgeInsets.only(
        top: 15.0,
        left: 10.0,
        right: 10.0,
      ),
      child: TextFormField(
        obscureText: permission,
        maxLines: 1,
        decoration: InputDecoration(
          labelText: labelValue,
          labelStyle: TextStyle(fontFamily: 'Lora', fontSize: 20.0),
          hintText: hintValue,
          hintStyle: TextStyle(fontFamily: 'Lora', fontSize: 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              width: 5.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget buttons() {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: RaisedButton(
              color: Colors.blueAccent,
              elevation: 15.0,
              child: Text(
                "Save",
                style: TextStyle(fontSize: 25.0, fontFamily: 'Lora'),
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return Container(
                        child: AnimatedSplashScreen(
                          splash: Image.asset(
                            'images/Intro.png',
                          ),
                          nextScreen: MainController(),
                          splashTransition: SplashTransition.rotationTransition,
                          duration: 1000,
                          animationDuration: Duration(milliseconds: 500),
                          //pageTransitionType: PageTransitionType.leftToRightWithFade,
                        ),
                      );
                    }));
              },
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1.0),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: RaisedButton(
              color: Colors.blueAccent,
              elevation: 15.0,
              child: Text(
                "Cancel",
                style: TextStyle(fontSize: 25.0, fontFamily: 'Lora'),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1.0),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

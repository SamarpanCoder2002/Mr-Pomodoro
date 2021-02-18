import 'package:hello_promodoro/Backend/Authentication.dart';
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
  TextEditingController _nameIs = TextEditingController();
  TextEditingController _pwdIs = TextEditingController();
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          leading: Icon(Icons.login),
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
        floatingActionButton: FloatingActionButton(
          tooltip: "Sign-Up",
          child: Icon(Icons.person_add_alt_1_outlined),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AccountManagerSignUp()));
          },
        ),
        body: Form(
          key: _formKey,
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
    TextEditingController controllerValue = TextEditingController();
    bool permission;

    indicator == "name"
        ? labelValue = "User Name"
        : labelValue = "Enter Password";
    indicator == "name"
        ? hintValue = "e.g: Samarpan Dasgupta"
        : hintValue = "e.g: sam1246";
    indicator == "name" ? permission = false : permission = true;

    TextEditingController takeControl(String indicator) =>
        indicator == "name" ? this._nameIs : this._pwdIs;

    return Container(
      margin: EdgeInsets.only(
        top: 10.0,
        left: 10.0,
        right: 10.0,
      ),
      child: TextFormField(
        autofocus: !permission,
        obscureText: permission,
        maxLines: 1,
        maxLength: 10,
        controller: takeControl(indicator),
        validator: (String _inputData) {
          if (_inputData.length < 1 || _inputData.length > 10)
            return "Maximum Length 10 and Minimum Length 1";
          return null;
        },
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
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  print(this._nameIs.text);
                  print(this._pwdIs.text);
                  Authenticate authenticate =
                      Authenticate(this._nameIs.text, this._pwdIs.text);
                  bool response = await authenticate.getData();
                  if (response) {
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
                          pageTransitionType:
                              PageTransitionType.rightToLeftWithFade,
                        ),
                      );
                    }));
                  } else {
                    print("Error Not Authentic message");
                  }
                }
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
                Authenticate authenticate =
                Authenticate(this._nameIs.text, this._pwdIs.text);
                authenticate.getAllData();
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

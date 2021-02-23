import 'package:flutter/material.dart';
import 'package:hello_promodoro/FrontEnd/welcomeScreen.dart';
import 'package:hello_promodoro/FrontEnd/Main_Screen.dart';
import 'package:hello_promodoro/FrontEnd/pomodoro_clock.dart';
import 'package:hello_promodoro/FrontEnd/Sign_up.dart';
import 'package:hello_promodoro/FrontEnd/pointsAndLevelsShow.dart';
import 'package:hello_promodoro/Backend/Authentication.dart';
import 'package:hello_promodoro/FrontEnd/aboutMake.dart';
import 'package:hello_promodoro/FrontEnd/PomoDoroAllCounterShow.dart';

void main() {
  var store = [10000,20000,30000,40000,50000];
  Authenticate authenticate = Authenticate("", "");
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Mr. PromoDoro",
    home: Welcome(),
  ));
}

import 'package:flutter/material.dart';
import 'package:hello_promodoro/UI/Welcome_screen.dart';
import 'package:hello_promodoro/UI/Main_Screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Mr. PromoDoro",
    home: Welcome(),
  ));
}

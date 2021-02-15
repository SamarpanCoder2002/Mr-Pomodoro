import 'package:flutter/material.dart';
import 'package:hello_promodoro/UI/Sign_up.dart';
import 'package:hello_promodoro/UI/Welcome_screen.dart';
import 'package:hello_promodoro/UI/Log_in.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Mr. PromoDoro",
    home: Welcome(),
  ));
}

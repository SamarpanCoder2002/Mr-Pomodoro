import 'package:flutter/material.dart';

import 'FrontEnd/welcomeScreen.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Generation',
    theme: ThemeData(
        fontFamily: 'Poppins',
        bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: Colors.transparent)),
    builder: (context, child) => MediaQuery(
      child: child!,
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
    ),
    home: Welcome(),
  ));
}

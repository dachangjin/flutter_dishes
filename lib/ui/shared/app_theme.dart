import 'package:flutter/material.dart';

class Apptheme {
  static const double smallFontSize = 16;
  static const double normalFontSize = 22;
  static const double largeFontSize = 24;
  static const double bigLargeFontSize = 26;


  static const Color normalTextColor = Colors.red;
  static const Color darkTextColor = Colors.green;



  static final ThemeData normalTheme = ThemeData(
    primarySwatch: Colors.pink,
    canvasColor: Color.fromRGBO(255, 254, 222, 1),
    textTheme: TextTheme(
      display1: TextStyle(fontSize: smallFontSize),
      display2: TextStyle(fontSize: normalFontSize),
      display3: TextStyle(fontSize: largeFontSize),
      display4: TextStyle(fontSize: bigLargeFontSize)

  )
  );

  static final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    textTheme: TextTheme(
      body1: TextStyle(fontSize: normalFontSize, color: darkTextColor)
    )
  );
}
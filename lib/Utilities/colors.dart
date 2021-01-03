import 'package:flutter/material.dart';

Color primaryColor = Colors.blue.shade400;
Color color1 = Colors.blue.shade200;
Color color2 = Colors.blue.shade600;
const String appName = "Weather App";
Color white = Colors.white;
LinearGradient linearGradient = LinearGradient(
  colors: [
    primaryColor,
    color1,
    color2,
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  stops: [],
);

TextTheme defaultTextTheme = TextTheme(
  // ignore: deprecated_member_use
  body1: TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w800,
  ),
);

import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double deviceHeight;
  static double deviceWidth;
  static Orientation orientation;
  init(BuildContext context) {
    deviceHeight = _mediaQueryData.size.height;
    deviceWidth = _mediaQueryData.size.width;
    orientation = _mediaQueryData.orientation;
  }
}

double proportionatScreenHeight(double inputValue) {
  return (inputValue / SizeConfig.deviceHeight) * 810;
}

double proportionatScreenWidth(double inputValue) {
  return (inputValue / SizeConfig.deviceWidth) * 375;
}

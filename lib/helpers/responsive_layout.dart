import 'package:flutter/material.dart';

class ResponsiveLayout {
  static getWidth(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    if (mediaQuery.width <= 1200) {
      return double.infinity;
    }

    return mediaQuery.width * 0.5;
  }

  static getAHundredPercentWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}

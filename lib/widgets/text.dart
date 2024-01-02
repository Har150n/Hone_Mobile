import 'package:flutter/material.dart';
class TextStyles {
  // Method to get scaled font size
  static double scaledFontSize(BuildContext context, double baseFontSize) {
    double screenWidth = MediaQuery.of(context).size.width;
    double scaleFactor = screenWidth / 1000; // 768 is the width of a standard iPad
    return baseFontSize * scaleFactor;
  }

  static TextStyle titleText(BuildContext context) => TextStyle(
    fontSize: scaledFontSize(context, 96),
    color: Colors.black,
    fontWeight: FontWeight.normal,
    fontFamily: 'Overpass_Mono',
    height: 0.9,
  );

  static TextStyle headingText(BuildContext context) => TextStyle(
    fontSize: scaledFontSize(context, 36),
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontFamily: 'Overpass_Mono',
    height: 0.9,
  );


  static TextStyle subtitleText(BuildContext context) => TextStyle(
    fontSize: scaledFontSize(context, 24),
    color: Colors.black,
    fontFamily: 'Overpass_Mono',
    height: 0.9,
  );

  static TextStyle biggerText(BuildContext context) => TextStyle(
    fontSize: scaledFontSize(context, 20),
    color: Colors.black,
    fontFamily: 'Overpass_Mono',
    height: 0.9,
  );

  static TextStyle text(BuildContext context) => TextStyle(
    fontSize: scaledFontSize(context, 16),
    color: Colors.black,
    fontFamily: 'Overpass_Mono',
    height: 0.9,
  );
}

import 'package:flutter/material.dart';
import 'package:hone_mobile/constant.dart';

class RoundedWhiteContainer extends StatelessWidget {
  final Widget child;
  final double padding;

  RoundedWhiteContainer({required this.child, this.padding = 16.0,});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double scaleFactor = screenHeight / ipadHeight;
    double scaledPadding = this.padding * scaleFactor;
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        onPressed: () { },
        child: Padding(
          padding: EdgeInsets.all(scaledPadding),
          child: child,
        ),
      ),
    );
  }
}

class RoundedWhiteContainerOnPressed extends StatelessWidget {
  final Widget child;
  final double padding;
  final VoidCallback? onPressed;

  RoundedWhiteContainerOnPressed({required this.child, this.padding = 16.0,
    required this.onPressed});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double scaleFactor = screenHeight / ipadHeight;
    double scaledPadding = this.padding * scaleFactor;
    double margin = scaleFactor * 10;
    return Container(
      margin: EdgeInsets.all(margin),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(scaledPadding),
          child: child,
        ),
      ),
    );
  }
}
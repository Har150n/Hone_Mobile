import 'package:flutter/material.dart';

class RoundedWhiteContainer extends StatelessWidget {
  final Widget child;
  final double padding;

  RoundedWhiteContainer({required this.child, this.padding = 8.0,});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
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
          padding: EdgeInsets.all(this.padding),
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

  RoundedWhiteContainerOnPressed({required this.child, this.padding = 8.0,
    required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
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
          padding: EdgeInsets.all(this.padding),
          child: child,
        ),
      ),
    );
  }
}
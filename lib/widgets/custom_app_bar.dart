import 'package:flutter/material.dart';
import 'text.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final Function onPressed;

  const CustomAppBar({
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 20),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            iconSize: 25,
            color: Colors.black,
            onPressed: () => onPressed(),
          ),
          Text(title,
              style: TextStyles.subtitleText
          ),
        ],
      ),
    );
  }
}
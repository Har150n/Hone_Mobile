import 'package:flutter/material.dart';
import 'package:hone_mobile/widgets/text.dart';
import 'package:hone_mobile/widgets/rounded_white_container.dart';
import 'package:hone_mobile/constant.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final Function onPressed;

  const CustomAppBar({
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double scaleFactor = screenHeight / ipadHeight;
    double scaledPadding = 8 * scaleFactor;
    return Row(
        children: [
          RoundedWhiteContainer(
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  iconSize: 25,
                  color: Colors.black,
                  onPressed: () => onPressed(),
                ),
                Text(title,
                    style: TextStyles.subtitleText(context)
                ),
              ]
            ),
            padding: scaledPadding,
          ),
          Expanded(child: SizedBox(height: 0.0)),
        ],
      );
  }
}
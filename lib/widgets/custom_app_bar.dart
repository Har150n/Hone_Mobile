import 'package:flutter/material.dart';
import 'package:hone_mobile/widgets/text.dart';
import 'package:hone_mobile/widgets/rounded_white_container.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final Function onPressed;

  const CustomAppBar({
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
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
                    style: TextStyles.subtitleText
                ),
              ]
            ),
            padding: 4,
          ),
          Expanded(child: SizedBox(height: 0.0)),
        ],
      );
  }
}
import 'package:flutter/material.dart';
import '../widgets/text.dart';
class StartMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/background.png',
            fit: BoxFit.cover,
          ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Emoquest',
                    style: TextStyles.titleText,
                    textAlign: TextAlign.center,
                  ),
                  IconButton(onPressed: () {
                    Navigator.pushNamed(context, '/storySelection');
                  }, icon: Icon(Icons.play_circle_rounded, size: 50), )
                ],
              ),
            )
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'text.dart';
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
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Emotion Detective',
                  style: TextStyles.titleText,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/storySelection');
                  },
                  child: const Text(
                    'Start',
                    style: TextStyle(fontSize: 24.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hone_mobile/widgets/custom_app_bar.dart';
import 'package:hone_mobile/widgets/text.dart';
import 'package:hone_mobile/helper_functions/url_launcher.dart';

class TosWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomAppBar(
              title: "Story Selection",
              onPressed: () {
                Navigator.pop(context); // Navigates to the previous screen
              },
            ),
            Expanded(child: SizedBox(height: 0.0)),
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'Read our Terms of Service ',
                  style: TextStyles.headingText(context),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'here',
                      style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Overpass_Mono'),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Handle hyperlink tap action here
                          launchURL(
                              'https://www.apple.com/legal/internet-services/itunes/dev/stdeula/');
                        },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(child: SizedBox(height: 0.0)),
          ],
        ),
      ),
    );
  }
}

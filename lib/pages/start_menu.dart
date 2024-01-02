import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hone_mobile/widgets/text.dart';
import 'package:hone_mobile/widgets/rounded_white_container.dart';
import 'package:purchases_flutter/models/customer_info_wrapper.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:hone_mobile/story_data/common_paths.dart';
import 'package:hone_mobile/constant.dart';

class StartMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double scaleFactor = screenHeight/ ipadHeight;
    double bottomMargin = 50 * scaleFactor;
    if (screenHeight < 500) {
      bottomMargin /= 2.5;
    }
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            gameBackgroundImagePath,
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    height: screenHeight * 0.5,
                    child: Image.asset(titleLogoImagePath, fit: BoxFit.cover)),
                Text(
                  'Emoquest',
                  style: TextStyles.titleText(context),
                  textAlign: TextAlign.center,
                ),
                RoundedWhiteContainerOnPressed(
                  child: Text(
                    'Play',
                    style: TextStyles.headingText(context),
                    textAlign: TextAlign.center,
                  ),
                  padding: 20.0,
                  onPressed: () {
                    Navigator.pushNamed(context, '/storySelection');
                  },
                ),
                RoundedWhiteContainerOnPressed(
                  child: Text(
                    'Restore Purchases',
                    style: TextStyles.subtitleText(context),
                  ),
                  onPressed: restorePurchases,
                  padding: 20.0,
                ),
                SizedBox(height: bottomMargin),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// restores Revenue Cat purchase
void restorePurchases() async {
  try {
    CustomerInfo customerInfo = await Purchases.restorePurchases();
    // ... check restored purchaserInfo to see if entitlement is now active
  } on PlatformException catch (e) {
    // Error restoring purchases
  }
}

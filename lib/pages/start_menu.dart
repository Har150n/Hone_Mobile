import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hone_mobile/widgets/text.dart';
import 'package:hone_mobile/widgets/rounded_white_container.dart';
import 'package:purchases_flutter/models/customer_info_wrapper.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:hone_mobile/story_data/common_paths.dart';

class StartMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: SizedBox(height: 0.0)),
                RoundedWhiteContainer(
                  child: const Text(
                    'Emoquest',
                    style: TextStyles.titleText,
                    textAlign: TextAlign.center,
                  ),
                  padding: 20.0,
                ),
                RoundedWhiteContainerOnPressed(
                  child: const Text(
                    'Play',
                    style: TextStyles.headingText,
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
                    style: TextStyles.subtitleText,
                  ),
                  onPressed: restorePurchases,
                  padding: 20.0,
                ),
                Expanded(
                  child: SizedBox(
                    height: 0.0
                  )
                )
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

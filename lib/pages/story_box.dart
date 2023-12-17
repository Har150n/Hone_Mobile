import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hone_mobile/pages/paywall.dart';
import 'package:hone_mobile/model/story.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:hone_mobile/constant.dart';
import 'package:hone_mobile/widgets/native_dialog.dart';
import 'package:hone_mobile/pages/game_page.dart';
import 'package:hone_mobile/widgets/text.dart';
import 'package:hone_mobile/helper_functions/purchases_helper.dart';



// checks if the user the subscribed, brings up paywall if not
void performMagic(BuildContext context, Story story) async {
  CustomerInfo customerInfo = await getCustomerInfo();
  bool storyIsAvailable = availableLevels.contains(story.storyNum);
  if (storyIsAvailable ||
      (customerInfo.entitlements.all[entitlementID] != null &&
          customerInfo.entitlements.all[entitlementID]?.isActive == true)) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              Game(
                story: story,
              ),
        ));
  } else {
    Navigator.pushNamed(context,'/parentGuard');
  }
}

// Represents one story rectangle on the story selection page
class StoryBox extends StatelessWidget {
  Story story;
  CustomerInfo customerInfo;
  bool completed;
  String completedSuffix = "";
  StoryBox(this.story, this.customerInfo, this.completed);

  @override
  Widget build(BuildContext context)  {
    String storyBoxTitle = story.title;
    int imageIndex = story.coverBackgroundIndex;
    // checks if story is locked
    if ((customerInfo.entitlements.all[entitlementID] == null ||
        customerInfo.entitlements.all[entitlementID]?.isActive == false) && !availableLevels.contains(story.storyNum)) {
      imageIndex = 10;
    }
    // checks if story is completed
    if (this.completed) {
      completedSuffix = " ✔️";
    }
    return Container(
      margin: EdgeInsets.all(8.0),
      width: MediaQuery
          .of(context)
          .size
          .width / 3,
      child: InkWell(
        onTap: () => performMagic(context, story),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Set the border color to black
                    width: 3.0, // Set the border width
                  ),
                ),
                child: Image.asset(
                  story.getBackgroundImagePath(imageIndex),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
              ),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        left: BorderSide(
                          color: Colors.black,
                          width: 3.0,
                        ),
                        right: BorderSide(
                          color: Colors.black,
                          width: 3.0,
                        ),
                        bottom: BorderSide(
                          color: Colors.black,
                          width: 3.0,
                        ))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    storyBoxTitle + completedSuffix,
                    style: TextStyles.subtitleText,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

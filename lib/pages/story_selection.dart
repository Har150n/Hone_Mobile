import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:hone_mobile/story_data/common_paths.dart';
import 'package:hone_mobile/widgets/custom_app_bar.dart';
import 'package:hone_mobile/pages/story_box.dart';
import 'package:hone_mobile/model/story.dart';
import 'package:hone_mobile/story_data/story_1_data.dart';
import 'package:hone_mobile/story_data/story_2_data.dart';
import 'package:hone_mobile/story_data/story_3_data.dart';
import 'package:hone_mobile/story_data/story_4_data.dart';
import 'package:hone_mobile/story_data/story_5_data.dart';
import 'package:hone_mobile/story_data/story_6_data.dart';
import 'package:hone_mobile/story_data/story_7_data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:hone_mobile/helper_functions/purchases_helper.dart';
import 'package:hone_mobile/helper_functions/background_audio.dart';
import 'package:hone_mobile/helper_functions/shared_preferences.dart';
import 'package:hone_mobile/widgets/text.dart';
import 'package:hone_mobile/constant.dart';

class StorySelection extends StatefulWidget {
  @override
  _StorySelectionState createState() => _StorySelectionState();
}

class _StorySelectionState extends State<StorySelection> {
  String appBarTitle = 'Story Selection';
  List<Story> stories = [
    StoryDataOne.story,
    StoryDataTwo.story,
    StoryDataThree.story,
    StoryDataFour.story,
    StoryDataFive.story,
    StoryDataSix.story,
    StoryDataSeven.story
  ];
  int activeIndex = 0;
  late Future<CustomerInfo> customerInfo;
  List<int> completedLevels = [];

  // gets customer data to be passed into StoryBox
  @override
  void initState() {
    super.initState();
    updateCompletedLevels();
    customerInfo = getCustomerInfo();
    playLoopedAudio(mainBackgroundAudioPath);
  }

  // fetches the completed levels from
  void updateCompletedLevels() async {
    List<int> tempCompletedLevels = await getCompletedLevels();
    setState(()  {
      completedLevels = tempCompletedLevels;
      print(completedLevels);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double scaleFactor = screenHeight/ ipadHeight;
    double storyHeight = 600 * scaleFactor;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            CustomAppBar(
              title: appBarTitle,
              onPressed: () {
                Navigator.pop(context); // Navigates to the previous screen
              },
            ),
            SizedBox(height: 50 * scaleFactor),
             Center(
                  child: Text('A new story every month!',
                      style: TextStyles.subtitleText(context))),
            FutureBuilder(
              future: customerInfo,
              builder: (BuildContext context, AsyncSnapshot<CustomerInfo> snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CarouselSlider.builder(
                                options: CarouselOptions(
                                    height: storyHeight,
                                    viewportFraction: 0.5,
                                    enlargeCenterPage: true,
                                    enlargeStrategy: CenterPageEnlargeStrategy.scale,
                                    onPageChanged: (index, reason) =>
                                        setState(() => activeIndex = index)),
                                itemCount: stories.length,
                                itemBuilder: (context, index, realIndex) {
                                  return StoryBox(stories[index], snapshot.data!,
                                      completedLevels.contains(stories[index].storyNum));
                                },
                              ),

                              buildIndicator(scaleFactor),
                            ])),
                  );
                } else {
                  return Center(
                    child: const CircularProgressIndicator()
                  );
                }
              }

            )
          ],
        ),
      ),
    );
  }

  // dots on the bottom of carousel
  Widget buildIndicator(double scaleFactor) {

    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: stories.length,
      effect: JumpingDotEffect(
          dotWidth: 20 * scaleFactor,
          dotHeight: 20 * scaleFactor,
          dotColor: Colors.grey,
          activeDotColor: Colors.black),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/text.dart';
import 'game_page.dart';
import '../model/story.dart';
import '../story_data/story_1_data.dart';
import '../story_data/story_2_data.dart';
import '../story_data/story_3_data.dart';
import '../story_data/story_4_data.dart';
import '../story_data/story_5_data.dart';
import '../story_data/story_6_data.dart';
import '../story_data/story_7_data.dart';

import 'package:carousel_slider/carousel_slider.dart';

class StoryBox extends StatelessWidget {
  Story story;
  StoryBox(this.story);

  @override
  Widget build(BuildContext context) {
    String storyBoxTitle = story.title;
    return Container(
      margin: EdgeInsets.all(8.0),
      width: MediaQuery.of(context).size.width / 3,
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Game(
                story: story,
              ),
            )),
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
                  story.getBackgroundImagePath(story.coverBackgroundIndex),
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
                    storyBoxTitle,
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
          children: [
            CustomAppBar(
              title: appBarTitle,
              onPressed: () {
                Navigator.pop(context); // Navigates to the previous screen
              },
            ),
            Expanded(
              child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    CarouselSlider.builder(
                      options: CarouselOptions(
                          height: MediaQuery.of(context).size.height / 1.5,
                          viewportFraction: 0.5,
                          enlargeCenterPage: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.scale,
                          onPageChanged: (index, reason) =>
                              setState(() => activeIndex = index)),
                      itemCount: stories.length,
                      itemBuilder: (context, index, realIndex) {
                        return StoryBox(stories[index]);
                      },
                    ),
                    const SizedBox(height: 32),
                    buildIndicator(),
                  ])),
            )
          ],
        ),
      ),
    );
  }

  // dots on the bottom of carousel
  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: stories.length,
        effect: JumpingDotEffect(
            dotWidth: 20,
            dotHeight: 20,
            dotColor: Colors.grey,
            activeDotColor: Colors.black),
      );
}

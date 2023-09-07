import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'text.dart';
import 'game_page.dart';
import 'story.dart';
import 'story_controller.dart';

class StoryBox extends StatelessWidget {
  Story story;
  StoryBox(this.story);

  @override
  Widget build(BuildContext context) {
    String storyBoxTitle = story.title;
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Game(story: story,),
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
                child: Image.asset(
                  story.backgroundImagePath,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5.0),
                child: Text(storyBoxTitle, style: TextStyles.text),
              ),
            ],
          ),
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
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 7 / 4,
                  children: [
                    StoryBox(
                        StoryController.storyMap['Ice Cream in the Park']!),
                    StoryBox(
                        StoryController.storyMap['Ice Cream in the Park']!),
                    StoryBox(
                        StoryController.storyMap['Ice Cream in the Park']!),
                    StoryBox(
                        StoryController.storyMap['Ice Cream in the Park']!)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


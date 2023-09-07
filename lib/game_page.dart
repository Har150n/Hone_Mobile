import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'story.dart';
import 'character.dart';
import 'event.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:camera/camera.dart';
import 'main.dart';

class Game extends StatefulWidget {
  final Story story;

  Game({required this.story});

  @override
  _GameState createState() {
    return _GameState(story: story);
  }
}

class _GameState extends State<Game> with SingleTickerProviderStateMixin {
  Story story;
  late List<Event> events;

  // audio controller
  var player = AudioPlayer();
  bool isAudioPlaying = false;

  // list of cameras
  CameraImage? cameraImage;
  CameraController? cameraController;

  int eventIndex = 0;
  List<int> initialPositions = [];
  List<String> initialEmotions = [];

  late Character charA;
  late Character charB;
  late Character charC;

  _GameState({required this.story}) {
    events = story.events;
    initialPositions = story.initialPositions;
    initialEmotions = story.initialEmotions;

    charA = this.story.characters[0];
    charB = this.story.characters[1];
    charC = this.story.characters[2];

  }

  @override
  void initState() {
    super.initState();
    print(isAudioPlaying);
    // reset the positions and emotions of the characters
    charA.position = initialPositions[0];
    charA.emotion = initialEmotions[0];
    charA.setImagePath();

    charB.position = initialPositions[1];
    charB.emotion = initialEmotions[1];
    charB.setImagePath();

    charC.position = initialPositions[2];
    charC.emotion = initialEmotions[2];
    charC.setImagePath();

    // resets events
    eventIndex = 0;

    // initialize camera
    if(cameras!.length != 0 ) {
      loadCamera();
    } else {
      cameraController = null;
    }
  }


  loadCamera() {
      cameraController = CameraController(cameras![0], ResolutionPreset.medium);
      cameraController!.initialize().then((value) {
        if(!mounted) {
          return;
        } else {
          setState(() {
            cameraController!.startImageStream((image)  {
              cameraImage = image;
              runModel();
            });
          });
        }
      });


  }

  // TODO: Implement trained model
  runModel() async {
    if(cameraImage != null) {
      // https://www.youtube.com/watch?v=R_gTJCBfDu0&t=571s
    }
  }


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double positionMultiplier = screenWidth / 8;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(story.backgroundImagePath),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(children: [
            CustomAppBar(
              title: story.title,
              onPressed: () {
                Navigator.pop(context); // Navigates to the previous screen
              },
            ),
            Expanded(
              child: InkWell(
                onTap: isAudioPlaying ? null : () {
                  setState(() {
                    nextEvent();
                  });
                },
                child: Stack(
                    children: [
                      AnimatedPositioned(
                          left: charA.position * positionMultiplier,
                          top: (1 * screenHeight) / 2,
                          duration: const Duration(milliseconds: 500),
                          child: Image.asset(charA.imagePath,
                              fit: BoxFit.fitHeight, height: 300)),
                      AnimatedPositioned(
                          left: charB.position * positionMultiplier,
                          top: (1 * screenHeight) / 2,
                          duration: Duration(milliseconds: 500),
                          child: Image.asset(charB.imagePath,
                              fit: BoxFit.fitHeight, height: 300)),
                      AnimatedPositioned(
                          left: charC.position * positionMultiplier,
                          top: (1 * screenHeight) / 2,
                          duration: Duration(milliseconds: 500),
                          child: Image.asset(charC.imagePath,
                              fit: BoxFit.fitHeight, height: 300)),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.height * 0.1,
                          child: cameraController == null ?
                          Icon(Icons.camera):
                          AspectRatio(
                              aspectRatio: cameraController!.value.aspectRatio,
                              child: CameraPreview(cameraController!)
                          )
                      ),
                    ]
                ),
              ),
            ),
          ]),
        ));
  }





  // if event is questionEvent
  // make the question widget visible
  // play the emotion audio question
  // * use local google teachable model to recognize emotions (happy, sad, angry, fear)
  // errorless teaching format, 6 or 7 seconds for player to make the face before proceeding

  // TODO: Train Google Teachable to recognitze 4 emotions
  // TODO: Create Question page widget
  // TODO: End of story logic
  //sets the position of certain characters based on the event's animationInstruction, increments the event index
  //returns false if it is the final event, true if not
  bool nextEvent() {
    Event event = events[eventIndex];

    if(event.emotionInstruction != null) {
      setEmotionInstruction(event);
    }
    if(event.animationInstruction != null) {
      setAnimationInstruction(event);
    }

    if(event.audioPath != "") {
      narrate(event.audioPath, event.duration);
    }

    //increment event
    if (eventIndex + 1 > events.length) {
      eventIndex = 0;
      return false;
    } else {
      eventIndex += 1;
    }
    return true;
  }

  // HELPER FUNCTIONS FOR nextEvent()

  void narrate(String audioFilePath, Duration duration) async {
    // Disables clicking
    setState(() {
      isAudioPlaying = true;
    });

    // Play the audio
    await player.play(AssetSource(audioFilePath));

    // Delay to wait for the specified duration
    await Future.delayed(duration);

    // Enables clicking after the delay
    setState(() {
      isAudioPlaying = false;
    });
  }



  // changes the emotion of the character based on the event object
  void setEmotionInstruction(Event event) {
    String characterEmotionId = event.emotionInstruction[0];
    String newEmotion = event.emotionInstruction.substring(1);
    // sets new emotion based on event
    if (characterEmotionId == "A") {
      charA.emotion = newEmotion;
      charA.setImagePath();
    } else if (characterEmotionId == "B") {
      charB.emotion = newEmotion;
      charA.setImagePath();
    } else if (characterEmotionId == "C") {
      charC.emotion = newEmotion;
      charA.setImagePath();
    } else {
      throw Exception('event not valid');
    }
  }

  //  changes the character's position based on event object
  void setAnimationInstruction(Event event) {
    String characterAnimationId = event.animationInstruction[0];
    int newPosition = int.parse(event.animationInstruction[1]);
    // sets new position based on event
    if (characterAnimationId == "A") {
      charA.position = newPosition;
    } else if (characterAnimationId == "B") {
      charB.position = newPosition;
    } else if (characterAnimationId == "C") {
      charC.position = newPosition;
    } else {
      throw Exception('event not valid');
    }
  }

}





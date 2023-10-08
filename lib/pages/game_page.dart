import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../model/story.dart';
import '../model/character.dart';
import '../model/event.dart';
import 'package:audioplayers/audioplayers.dart';
import '../helper_functions/background_audio.dart';
// import 'package:camera/camera.dart';

// TODO: Create character_controller.dart

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

  // background audio controller
  var backgroundPlayer = AudioPlayer();

  //// list of cameras
  // CameraImage? cameraImage;
  // CameraController? cameraController;

  int eventIndex = 0;
  List<int> initialPositions = [];
  List<String> initialEmotions = [];

  late Character charA;
  late Character charB;
  late Character charC;
  late Character charD;

  _GameState({required this.story}) {
    events = story.events;
    initialPositions = story.initialPositions;
    initialEmotions = story.initialEmotions;

    charA = this.story.characters[0];
    charB = this.story.characters[1];
    charC = this.story.characters[2];
    charD = this.story.characters[3];

  }

  @override
  void initState() {
    super.initState();
    // reset the positions and emotions of the characters
    charA.position = initialPositions[0];
    charA.emotion = initialEmotions[0];
    charA.setImagePath();
    charA.enlarged = false;

    charB.position = initialPositions[1];
    charB.emotion = initialEmotions[1];
    charB.setImagePath();
    charB.enlarged = false;

    charC.position = initialPositions[2];
    charC.emotion = initialEmotions[2];
    charC.setImagePath();
    charC.enlarged = false;

    charD.position = initialPositions[3];
    charD.emotion = initialEmotions[3];
    charD.setImagePath();
    charD.enlarged = false;

    // resets events
    eventIndex = 0;

    //// initialize camera
    // if(cameras!.length != 0 ) {
    //   loadCamera();
    // } else {
    //   cameraController = null;
    // }

    // play background music
    backgroundPlayer.setVolume(0.3);
    playLoopedAudio("audio/background_music.mp3");
  }

  // stop background music
  @override
  Future<void> dispose() async {
    super.dispose(); //change here
    stopBackgroundAudio();
    await player.stop();
  }

  // loadCamera() {
  //     cameraController = CameraController(cameras![0], ResolutionPreset.medium);
  //     cameraController!.initialize().then((value) {
  //       if(!mounted) {
  //         return;
  //       } else {
  //         setState(() {
  //           cameraController!.startImageStream((image)  {
  //             cameraImage = image;
  //             runModel();
  //           });
  //         });
  //       }
  //     });
  // }

  //// TODO: Implement trained model
  // runModel() async {
  //   if(cameraImage != null) {
  //     // https://www.youtube.com/watch?v=R_gTJCBfDu0&t=571s
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // multiplier to determine correct scaling of character positioning
    double screenHeight = MediaQuery.of(context).size.height;
    double distanceFromTop = screenHeight / 3;
    double positionMultiplier = screenWidth / 8;
    double enlargedHeight = screenHeight / 2;
    double normalHeight = screenHeight / 2.3;
    const Duration animationDuration = Duration(milliseconds: 500);


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
                          height: charA.enlarged ? enlargedHeight : normalHeight,
                          left: charA.position * positionMultiplier,
                          top: distanceFromTop,
                          duration: animationDuration,
                          child: Image.asset(charA.imagePath,
                              fit: BoxFit.fitHeight, )),
                      AnimatedPositioned(
                          height: charB.enlarged ? enlargedHeight : normalHeight,
                          left: charB.position * positionMultiplier,
                          top: distanceFromTop,
                          duration: animationDuration,
                          child: Image.asset(charB.imagePath,
                              fit: BoxFit.fitHeight, )),
                      AnimatedPositioned(
                          height: charC.enlarged ? enlargedHeight : normalHeight,
                          left: charC.position * positionMultiplier,
                          top: distanceFromTop,
                          duration: animationDuration,
                          child: Image.asset(charC.imagePath,
                              fit: BoxFit.fitHeight, )),
                      AnimatedPositioned(
                          height: charD.enlarged ? enlargedHeight : normalHeight,
                          left: charD.position * positionMultiplier,
                          top: distanceFromTop,
                          duration: animationDuration,
                          child: Image.asset(charD.imagePath,
                            fit: BoxFit.fitHeight, )),
                      // Container(
                      //     height: MediaQuery.of(context).size.height * 0.2,
                      //     width: MediaQuery.of(context).size.height * 0.1,
                      //     child: cameraController == null ?
                      //     Icon(Icons.camera):
                      //     AspectRatio(
                      //         aspectRatio: cameraController!.value.aspectRatio,
                      //         child: CameraPreview(cameraController!)
                      //     )
                      // ),
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
  // TODO: Create Question page widget
  // TODO: End of story logic
  //sets the position of certain characters based on the event's animationInstruction, increments the event index
  //returns false if it is the final event, true if not
  bool nextEvent() {
    Event event = events[eventIndex];

    if(!event.emotionInstruction.isEmpty) {
      setEmotionInstruction(event);
    }
    if(!event.animationInstruction.isEmpty) {
      setAnimationInstruction(event);
    }
    if(!event.audioPath.isEmpty) {
      narrate(event.audioPath, event.duration);
    }
    if(!event.enlargeInstruction.isEmpty) {
      setEnlarge(event);
    }

    //increment event
    if (eventIndex + 1 >= events.length) {
      eventIndex = 0;
      exitScreen();
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
        charB.setImagePath();
      } else if (characterEmotionId == "C") {
        charC.emotion = newEmotion;
        charC.setImagePath();
      } else if (characterEmotionId == "D") {
        charD.emotion = newEmotion;
        charD.setImagePath();
      } else {
        throw Exception('event not valid');
      }
  }

  //  changes the character's position based on event object
  void setAnimationInstruction(Event event) {
    for (int i = 0; i < event.animationInstruction.length; i += 2) {
      String characterAnimationId = event.animationInstruction[i];
      int newPosition = int.parse(event.animationInstruction[i+1]);
      // sets new position based on event
      if (characterAnimationId == "A") {
        charA.position = newPosition;
      } else if (characterAnimationId == "B") {
        charB.position = newPosition;
      } else if (characterAnimationId == "C") {
        charC.position = newPosition;
      } else if (characterAnimationId == "D") {
        charD.position = newPosition;
      } else {
        throw Exception('event not valid');
      }
    }
  }

  // animates the character to be enlarged while speaking
  void setEnlarge(Event event) async {
    for (int i = 0; i < event.enlargeInstruction.length; i++) {
      String enlargeId = event.enlargeInstruction[i];
      // sets new position based on event
      if (enlargeId == "A") {
        charA.enlarged = true;
        // waits for event to finish before reverting to normal size
        await Future.delayed(event.duration);
        charA.enlarged = false;
      } else if (enlargeId == "B") {
        charB.enlarged = true;
        await Future.delayed(event.duration);
        charB.enlarged = false;
      } else if (enlargeId == "C") {
        charC.enlarged = true;
        await Future.delayed(event.duration);
        charC.enlarged = false;
      } else if (enlargeId == "D") {
        await Future.delayed(event.duration);
        charD.enlarged = false;
      }else {
        throw Exception('event not valid');
      }
    }
  }

  // returns to Story Selection after a Delay
  void exitScreen() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pop(context);
  }
}





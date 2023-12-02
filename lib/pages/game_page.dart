import 'package:flutter/material.dart';
import 'package:hone_mobile/controller/character_controller.dart';
import '../widgets/custom_app_bar.dart';
import '../model/story.dart';
import '../model/event.dart';
import 'package:audioplayers/audioplayers.dart';
import '../helper_functions/background_audio.dart';
import '../model/character.dart';
import '../widgets/text.dart';
// import 'package:camera/camera.dart';

class Game extends StatefulWidget {
  final Story story;

  Game({required this.story}) {}

  @override
  _GameState createState() {
    return _GameState(story: story);
  }
}

class _GameState extends State<Game> with SingleTickerProviderStateMixin {
  late Story story;
  late List<Event> events;
  late CharacterController characterController;
  bool isAudioPlaying = false;
  bool isQuestionEvent = false;

  // background audio controller
  var backgroundPlayer = AudioPlayer();

  _GameState({required story}) {
    characterController = CharacterController(
        story: story,
        updateAudioPlaying: AudioBoolChanged,
        updateQuestionEvent: QuestionBoolChanged);
    events = story.getEvents();
  }

  @override
  void initState() {
    super.initState();
    // reset the positions and emotions of the characters
    characterController.initialize();
  }

  // stop background music
  @override
  Future<void> dispose() async {
    super.dispose(); //change here
    stopBackgroundAudio();
    await characterController.player.stop();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // multiplier to determine correct scaling of character positioning
    double positionMultiplier = screenWidth / 8;

    double distanceFromTop = screenHeight / 3;
    double enlargedHeight = screenHeight / 2;
    double normalHeight = screenHeight / 2.3;
    const Duration animationDuration = Duration(milliseconds: 500);

    List<Character> characters = characterController.getCharacterList();
    Story story = characterController.getStory();

    return Scaffold(
        body: Container(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(story.getBackgroundImagePath(this.characterController.currentBackgroundIndex)),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(children: [
        CustomAppBar(
          title: story.getTitle(),
          onPressed: () {
            Navigator.pop(context); // Navigates to the previous screen
          },
        ),
        Expanded(
          child: InkWell(
            onTap: characterController.getAudioPlaying()
                ? null
                : () {
                    setState(() {
                      // if last event, exit to screen
                      if (!characterController.nextEvent()) {
                        exitScreen();
                      }
                      ;
                    });
                  },
            child: Stack(children: [
              for (Character character in characters)
                AnimatedPositioned(
                  height: character.enlarged ? enlargedHeight : normalHeight,
                  left: character.position * positionMultiplier,
                  top: distanceFromTop,
                  duration: animationDuration,
                  child:
                      Image.asset(character.imagePath, fit: BoxFit.fitHeight),
                ),
            ]),
          ),
        ),
        // Answer Buttons
        Visibility(
            visible: isQuestionEvent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // To evenly space the buttons
              children:
                  characterController.currentQuestion.emotions.map((option) {
                return ElevatedButton(
                  onPressed: () {
                    // Add your button click logic here
                    characterController.processAnswer(option);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    // Sets the button color to orange
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          8.0),
                    ),
                    minimumSize: Size(screenWidth/6, screenWidth/24)
                  ),
                  child: Text(option, style: TextStyles.subtitleText),
                );
              }).toList(),
            ))
      ]),
    ));
  }

  // sets audio playing
  void AudioBoolChanged(bool isAudioPlaying) {
    setState(() {
      this.isAudioPlaying = isAudioPlaying;
    });
  }

  // sets question page visibility
  void QuestionBoolChanged(bool isQuestionEvent) {
    setState(() {
      this.isQuestionEvent = isQuestionEvent;
    });
  }

  // returns to Story Selection after a Delay
  void exitScreen() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pop(context);
  }
}

//// list of cameras
// CameraImage? cameraImage;
// CameraController? cameraController;
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
// Container(
//     height: MediaQuery.of(context).size.height * 0.2,
//     width: MediaQuery.of(context).size.height * 0.1,
//     child: cameraController == null ?
//     Icon(Icons.camera):
//     AspectRatio(
//         aspectRatio: cameraController!.value.aspectRatio,
//         child: CameraPreview(cameraController!)
//     )

// previous animatedpositioned
// AnimatedPositioned(
//     height: charA.enlarged ? enlargedHeight : normalHeight,
//     left: charA.position * positionMultiplier,
//     top: distanceFromTop,
//     duration: animationDuration,
//     child: Image.asset(charA.imagePath,
//         fit: BoxFit.fitHeight, )),
// AnimatedPositioned(
//     height: charB.enlarged ? enlargedHeight : normalHeight,
//     left: charB.position * positionMultiplier,
//     top: distanceFromTop,
//     duration: animationDuration,
//     child: Image.asset(charB.imagePath,
//         fit: BoxFit.fitHeight, )),
// AnimatedPositioned(
//     height: charC.enlarged ? enlargedHeight : normalHeight,
//     left: charC.position * positionMultiplier,
//     top: distanceFromTop,
//     duration: animationDuration,
//     child: Image.asset(charC.imagePath,
//         fit: BoxFit.fitHeight, )),
// AnimatedPositioned(
//     height: charD.enlarged ? enlargedHeight : normalHeight,
//     left: charD.position * positionMultiplier,
//     top: distanceFromTop,
//     duration: animationDuration,
//     child: Image.asset(charD.imagePath,
//       fit: BoxFit.fitHeight, )),

//// initialize camera (put inside initState())
// if(cameras!.length != 0 ) {
//   loadCamera();
// } else {
//   cameraController = null;
// }

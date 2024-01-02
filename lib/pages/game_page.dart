import 'package:flutter/material.dart';
import 'package:hone_mobile/controller/character_controller.dart';
import 'package:hone_mobile/widgets/custom_app_bar.dart';
import 'package:hone_mobile/model/story.dart';
import 'package:hone_mobile/model/event.dart';
import 'package:hone_mobile/helper_functions/background_audio.dart';
import 'package:hone_mobile/model/character.dart';
import 'package:hone_mobile/widgets/text.dart';
import 'package:hone_mobile/story_data/common_paths.dart';
import 'package:flutter_shakemywidget/flutter_shakemywidget.dart';
import 'package:hone_mobile/constant.dart';

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
  bool isCorrect = false; // turns true if answer is correct
  OverlayEntry? _overlayEntry;

  // key to trigger button shakes
  final shakeKey = GlobalKey<ShakeWidgetState>();
  int shakeNum = 1;

  _GameState({required story}) {
    characterController = CharacterController(
        story: story,
        updateAudioPlaying: AudioBoolChanged,
        updateQuestionEvent: QuestionBoolChanged,
        updateIsCorrect: IsCorrectBoolChanged);
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
    _hideOverlay();
    super.dispose();
    playLoopedAudio(mainBackgroundAudioPath);
    await characterController.dialoguePlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    // multiplier to determine correct scaling of character positioning
    double positionMultiplier = screenWidth / 8;

    double distanceFromTop = (screenHeight / 3);
    double enlargedHeight = (screenHeight / 2);
    double normalHeight = (screenHeight / 2.3);
    if (screenHeight < 500) {
      distanceFromTop /= 2.5;
      enlargedHeight *= 1.2;
      normalHeight *= 1.2;
    }
    const Duration animationDuration = Duration(milliseconds: 500);

    List<Character> characters = characterController.getCharacterList();
    Story story = characterController.getStory();

    return Scaffold(
        body: Container(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(story.getBackgroundImagePath(
              this.characterController.currentBackgroundIndex)),
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
      ]),
    ));
  }

  // hides the button overlay
  void _hideOverlay() {
    if(_overlayEntry != null) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  // shows the button overlay
  void _showOverlay(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double scaleFactor = screenHeight / ipadHeight;
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        // You can adjust these to position your overlay as needed
        left: 0,
        bottom: 30 * scaleFactor,
        right: 0,
        child: Material(
          color: Colors.transparent,
          child: ShakeMe(
              key: shakeKey,
              shakeCount: shakeNum,
              shakeOffset: 5,
              shakeDuration: Duration(milliseconds: 500),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // To evenly space the buttons
                children: characterController.currentQuestion.emotions
                    .map((option) {
                  return ElevatedButton(
                    onPressed: () {
                      if (characterController.processAnswer(option)) {
                        setState(() {
                          isCorrect = true;
                        });
                      } else {
                        setState(() {
                          shakeNum = 2;
                          shakeKey.currentState?.shake();
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                        isCorrect ? Colors.green : Colors.white,
                        // Sets the button color to orange
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        minimumSize: Size(screenWidth / 6, screenWidth / 24)),
                    child:
                    Text(option, style: TextStyles.subtitleText(context)),
                  );
                }).toList(),
              )),
        ),
      ),
    );
    Overlay.of(context)?.insert(_overlayEntry!);
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
      if (isQuestionEvent == true) {
        _hideOverlay();
        _showOverlay(context);
      } else {
        _hideOverlay();
      }

    });
  }

  // sets answer to correct
  void IsCorrectBoolChanged(bool isCorrect) {
    setState(() {
      this.isCorrect = isCorrect;
      // updates overlay to make answers green
      shakeNum = 1;
      shakeKey.currentState?.shake();
      if (isCorrect == true) {
        _hideOverlay();
        _showOverlay(context);
      }
    });
  }

  // returns to Story Selection after a Delay
  void exitScreen() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pop(context);
  }
}

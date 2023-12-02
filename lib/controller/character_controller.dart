import 'package:flutter/cupertino.dart';
import '../model/story.dart';
import '../model/character.dart';
import '../helper_functions/background_audio.dart';
import '../model/event.dart';
import 'package:audioplayers/audioplayers.dart';
import '../model/question.dart';

class CharacterController {
  Story story;
  late List<Character> characterList;
  Question currentQuestion =
  Question(emotions: ["unitialized","unitialized","unitialized","unitialized" ],
      answer: "unitialized");
  late List<Event> events;
  int eventIndex = 0;
  List<int> initialPositions = [];
  List<String> initialEmotions = [];
  int currentBackgroundIndex = 1;
  
  // audio controller
  var player = AudioPlayer();
  bool isAudioPlaying = false;
  
  // callback function to update bools in game_page.dart
  final ValueChanged<bool> updateAudioPlaying;
  final ValueChanged<bool> updateQuestionEvent;
  
  CharacterController({
    required this.story, required this.updateAudioPlaying,
    required this.updateQuestionEvent}) {
    initialPositions = story.initialPositions;
    initialEmotions = story.initialEmotions;
    characterList = this.story.characters;
    events = this.story.events;
  }

  // reset the positions and emotions of the characters
  void initialize() {
    for (int i = 0; i < characterList.length; i++) {
      characterList[i].position = initialPositions[i];
      characterList[i].emotion = initialEmotions[i];
      characterList[i].setImagePath();
      characterList[i].enlarged = false;
    }
    // resets events
    eventIndex = 0;

    // play background music
    backgroundPlayer.setVolume(0.3);
    playLoopedAudio("audio/background_music.mp3");
  }

  //sets the position of certain characters based on the event's animationInstruction, increments the event index
  //returns false if it is the final event, true if not
  bool nextEvent() {
    if (events[eventIndex] is GeneralEvent) {
      GeneralEvent genEvent = events[eventIndex] as GeneralEvent;
      processGeneralEvent(genEvent);
    } else if (events[eventIndex] is QuestionEvent) {
      QuestionEvent questEvent = events[eventIndex] as QuestionEvent;
      processQuestionEvent(questEvent);
    }
    //increment event
    if (eventIndex + 1 >= events.length) {
      eventIndex = 0;
      return false;
    } else {
      eventIndex += 1;
      return true;
    }
  }

  // HELPER FUNCTIONS FOR nextEvent()

  void processGeneralEvent(GeneralEvent event) {
    if (event.emotionInstruction.isNotEmpty) {
      setEmotionInstruction(event);
    }
    if (event.animationInstruction.isNotEmpty) {
      setAnimationInstruction(event);
    }
    if (event.audioPath.isNotEmpty) {
      narrate(event.audioPath, event.duration);
    }
    if (event.enlargeInstruction.isNotEmpty) {
      setEnlarge(event);
    }
    if(event.backgroundInstruction != -1) {
      setBackground(event);
    }
  }

  // changes the emotion of the character based on the event object
  void setEmotionInstruction(GeneralEvent event) {
    List<String> instructionList = event.emotionInstruction.split(' ');
    for (String instruction in instructionList) {
      String characterEmotionId = instruction[0];
      String newEmotion = instruction.substring(1);
      for (Character character in characterList)
        if (character.getId() == characterEmotionId) {
          character.emotion = newEmotion;
          character.setImagePath();
        }
    }
  }

  //  changes the character's position based on event object
  void setAnimationInstruction(GeneralEvent event) {
    for (int i = 0; i < event.animationInstruction.length; i += 2) {
      String characterAnimationId = event.animationInstruction[i];
      int newPosition = int.parse(event.animationInstruction[i + 1]);

      for (Character character in characterList)
        if (character.getId() == characterAnimationId) {
          character.position = newPosition;
        }

    }
  }

  // animates the character to be enlarged while speaking
  void setEnlarge(GeneralEvent event) async {
    for (int i = 0; i < event.enlargeInstruction.length; i++) {
      String enlargeId = event.enlargeInstruction[i];
      for (Character character in characterList) {
        if (character.getId() == enlargeId) {
          character.enlarged = true;
          // waits for event to finish before reverting to normal size
          await Future.delayed(event.duration);
          character.enlarged = false;
        }
      }
    }
  }

  // sets the background
  void setBackground(GeneralEvent event) {
    this.currentBackgroundIndex = event.backgroundInstruction;
  }

  void narrate(String audioFilePath, Duration duration) async {
    // Disables clicking
    isAudioPlaying = true;
    updateAudioPlaying(isAudioPlaying);

    // Play the audio
    await player.play(AssetSource(audioFilePath));

    // Delay to wait for the specified duration
    await Future.delayed(duration);

    // Enables clicking after the delay
    isAudioPlaying = false;
    updateAudioPlaying(isAudioPlaying);
  }

  // Processes question event
  void processQuestionEvent(QuestionEvent questEvent) {
    // sets cur question so it can be accessed by game_page.dart
    this.currentQuestion = questEvent.question;
    // makes question widget visible using callback function
    updateQuestionEvent(true);
    // disables clicking so can't go to next event
    updateAudioPlaying(true);

    if (!questEvent.audioPath.isEmpty) {
      narrate(questEvent.audioPath, questEvent.duration);
    }
  }

  // awaits user input from game_page
  // returns True if answer matches the current question's answer
  Future<bool> processAnswer(String answer) async {
    if (this.currentQuestion != null) {
      if (answer == this.currentQuestion.answer) {
        // play correct sound
        await Future.delayed(Duration(seconds: 1));
        updateQuestionEvent(false);
        updateAudioPlaying(false);
        nextEvent();
        return true;
      } else {
      return false;
      }
    } else {
      throw("current question does not exist");
    }

  }

  // Getters and Setters
  bool getAudioPlaying() {
    return isAudioPlaying;
  }

  Story getStory() {
    return story;
  }

  List<Character> getCharacterList() {
    return characterList;
  }
}

import 'package:flutter/cupertino.dart';
import 'package:hone_mobile/model/story.dart';
import 'package:hone_mobile/model/character.dart';
import 'package:hone_mobile/helper_functions/background_audio.dart';
import 'package:hone_mobile/model/event.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:hone_mobile/model/question.dart';
import 'package:hone_mobile/story_data/common_paths.dart';
import 'package:hone_mobile/helper_functions/shared_preferences.dart';
import 'package:hone_mobile/helper_functions/sound_effect_audio.dart';


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
  var dialoguePlayer = AudioPlayer();
  bool isAudioPlaying = false;
  
  // callback function to update bools in game_page.dart
  final ValueChanged<bool> updateAudioPlaying;
  final ValueChanged<bool> updateQuestionEvent;
  final ValueChanged<bool> updateIsCorrect;

  CharacterController({
    required this.story, required this.updateAudioPlaying,
    required this.updateQuestionEvent,
    required this.updateIsCorrect}) {

    initialPositions = story.initialPositions;
    initialEmotions = story.initialEmotions;
    characterList = this.story.characters;
    events = this.story.events;
  }

  // reset the positions and emotions of the characters
  void initialize() {
    playLoopedAudio(this.story.backgroundAudioPath);
    for (int i = 0; i < characterList.length; i++) {
      characterList[i].position = initialPositions[i];
      characterList[i].emotion = initialEmotions[i];
      characterList[i].setImagePath();
      characterList[i].enlarged = false;
    }
    // resets events
    eventIndex = 0;
  }

  //sets the position of certain characters based on the event's animationInstruction, increments the event index
  //returns false if it is the final event, true if not
  bool nextEvent() {
    if (events[eventIndex] is GeneralEvent) {
      GeneralEvent genEvent = events[eventIndex] as GeneralEvent;
      processGeneralEvent(genEvent, eventIndex + 1 == events.length);
    } else if (events[eventIndex] is QuestionEvent) {
      QuestionEvent questEvent = events[eventIndex] as QuestionEvent;
      processQuestionEvent(questEvent);
    }
    //increment event
    if (eventIndex + 1 >= events.length) {
      eventIndex = 0;
      addCompletedLevel(this.story.storyNum);
      return false;
    } else {
      eventIndex += 1;
      return true;
    }
  }

  // HELPER FUNCTIONS FOR nextEvent()

  void processGeneralEvent(GeneralEvent event, bool lastEvent) {
    // Disables clicking
    isAudioPlaying = true;
    updateAudioPlaying(isAudioPlaying);
    if (event.emotionInstruction.isNotEmpty) {
      setEmotionInstruction(event);
    }
    if (event.animationInstruction.isNotEmpty) {
      setAnimationInstruction(event);
    }
    if (event.audioPath.isNotEmpty) {
      narrate(event.audioPath);
    }
    if (event.enlargeInstruction.isNotEmpty) {
      setEnlarge(event);
    }
    if(event.backgroundInstruction != -1) {
      setBackground(event);
    }
    // doesn't reenable clicking if last event
    if(!lastEvent) {
      delayEnableClicking(event.duration);
    }
  }

  // Processes question event
  void processQuestionEvent(QuestionEvent questEvent) {
    disableClicking();
    this.currentQuestion = questEvent.question;
    // makes question widget visible using callback function
    updateQuestionEvent(true);
    if (!questEvent.audioPath.isEmpty) {
      narrate(questEvent.audioPath);
    }
  }

  // awaits user input from game_page
  // returns True if answer matches the current question's answer
  bool processAnswer(String answer) {
    if (this.currentQuestion != null) {
      if (answer == this.currentQuestion.answer) {
        soundEffectPlayer.play(AssetSource(correctAnswerAudioPath));
        updateIsCorrect(true);
        resetQuestionState();
        return true;
      } else {
        soundEffectPlayer.play(AssetSource(whoopAudioPath));
      return false;
      }
    } else {
      throw("current question does not exist");
    }
  }

  // gets rid of question widget after a delay
  // make screen clickable
  // makes the button color white again
  void resetQuestionState() async {
    await Future.delayed(Duration(seconds: 1));
    isAudioPlaying = false;
    updateQuestionEvent(false);
    updateAudioPlaying(false);
    updateIsCorrect(false);
    nextEvent();
  }

  // waits for the given duration and then enables clicking
  void delayEnableClicking(Duration duration) async {
    await Future.delayed(duration);
    isAudioPlaying = false;
    updateAudioPlaying(isAudioPlaying);
  }

  // disables clicking
  void disableClicking() {
    isAudioPlaying = true;
    updateAudioPlaying(isAudioPlaying);
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
    List<String> instructionList = event.animationInstruction.split(' ');
    for (String instruction in instructionList) {
      String characterAnimationId = instruction[0];
      int newPosition = int.parse(instruction.substring(1));
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

  void narrate(String audioFilePath) {
    // Play the audio
    dialoguePlayer.play(AssetSource(audioFilePath));
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

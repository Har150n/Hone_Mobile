import 'package:hone_mobile/model/story.dart';
import 'package:hone_mobile/model/character.dart';
import 'package:hone_mobile/model/event.dart';
import 'image_maps.dart';
import 'package:hone_mobile/model/question.dart';
import 'common_paths.dart';

// Story 3: Beach
class StoryDataThree {
  static List<Character> characterList = [
    Character(Id: "A", position: -3, emotion: 'happy_trunks',
        imageDict: mainBoyImageMap, enlarged: false),
    Character(Id: "B", position: -2, emotion: 'happy',
        imageDict: motherImageMap, enlarged: false),
    Character(Id: "C", position: 20, emotion: 'default',
        imageDict: sandcastleMap, enlarged: false),
    Character(Id :"D", position: 8, emotion: 'happy',
        imageDict: {'happy': 'assets/images/characters/placeholder.png'}, enlarged: false),
  ];
  static List<Event> eventList = [
    GeneralEvent(duration: Duration(seconds: 7), audioPath: "audio/narration/3/story_3_narration_1.mp3",
        animationInstruction: "A0 B1", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 3), audioPath: "audio/narration/3/story_3_narration_2.m4a",
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "A", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 5), audioPath: "audio/narration/3/story_3_narration_3.mp3",
        animationInstruction: "", emotionInstruction: "Bhappy_sunscreen", enlargeInstruction: "B", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 3), audioPath: "audio/narration/3/story_3_narration_4.m4a",
        animationInstruction: "", emotionInstruction: "Bhappy", enlargeInstruction: "A", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 8), audioPath: "audio/narration/3/story_3_narration_5.mp3",
        animationInstruction: "A4", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 3), audioPath: "audio/narration/3/story_3_narration_6.m4a",
        animationInstruction: "", emotionInstruction: "Ascared_trunks", enlargeInstruction: "A", backgroundInstruction: -1),
    QuestionEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/3/story_3_narration_7.mp3",
        question: Question(emotions: ["Happy" , "Sad", "Angry", "Scared"], answer: "Scared")),
    GeneralEvent(duration: Duration(seconds: 2), audioPath: scaredAudioPath,
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 3), audioPath: "audio/narration/3/story_3_narration_9.mp3",
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 3), audioPath: "audio/narration/3/story_3_narration_10.mp3",
        animationInstruction: "", emotionInstruction: "Ahappy_trunks", enlargeInstruction: "", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/3/story_3_narration_11.m4a",
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "A", backgroundInstruction: -1),
    QuestionEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/3/story_3_narration_12.mp3",
        question: Question(emotions: ["Happy" , "Sad", "Angry", "Scared"], answer: "Happy")),
    GeneralEvent(duration: Duration(seconds: 2), audioPath: happyAudioPath,
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 3), audioPath: "audio/narration/3/story_3_narration_14.mp3",
        animationInstruction: "B3", emotionInstruction: "Bhappy_shovel", enlargeInstruction: "B", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/3/story_3_narration_15.m4a",
        animationInstruction: "A1", emotionInstruction: "Ahappy_trunks_shovel", enlargeInstruction: "A", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 3), audioPath: "audio/narration/3/story_3_narration_16.mp3",
        animationInstruction: "C2", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 3), audioPath: "audio/narration/3/story_3_narration_17.mp3",
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "B", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/7/story_7_narration_5.m4a",
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "A", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 6), audioPath: "audio/narration/3/story_3_narration_19.mp3",
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/3/story_3_narration_20.mp3",
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "B", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 5), audioPath: "audio/narration/3/story_3_narration_21.mp3",
        animationInstruction: "A0 B4 C8", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 3), audioPath: "audio/narration/3/story_3_narration_22.m4a",
        animationInstruction: "", emotionInstruction: "Asad_trunks_shovel", enlargeInstruction: "A", backgroundInstruction: -1),
    QuestionEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/3/story_3_narration_23.mp3",
        question: Question(emotions: ["Happy" , "Sad", "Angry", "Scared"], answer: "Sad")),
    GeneralEvent(duration: Duration(seconds: 2), audioPath: sadAudioPath,
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 8), audioPath: "audio/narration/3/story_3_narration_25.mp3",
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "B", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 8), audioPath: "audio/narration/3/story_3_narration_26.mp3",
        animationInstruction: "A4 B5", emotionInstruction: "Bhappy", enlargeInstruction: "", backgroundInstruction: 2),
    GeneralEvent(duration: Duration(seconds: 3), audioPath: "audio/narration/3/story_3_narration_27.m4a",
        animationInstruction: "", emotionInstruction: "Ahappy_trunks", enlargeInstruction: "A", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 4), audioPath: "audio/narration/3/story_3_narration_28.mp3",
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "B", backgroundInstruction: -1),
    QuestionEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/3/story_3_narration_29.mp3",
        question: Question(emotions: ["Happy" , "Sad", "Angry", "Scared"], answer: "Happy")),
    GeneralEvent(duration: Duration(seconds: 2), audioPath: happyAudioPath,
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 8), audioPath: "audio/narration/3/story_3_narration_31.mp3",
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 2), audioPath: "",
        animationInstruction: "A8 B8", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),

  ];

  static Story story =
  Story(storyNum: 3, title: 'Beach Day!',
      backgroundImagePath:
      { 1 : 'assets/images/backdrops/story_3/beach_sunny.png',
        2 : "assets/images/backdrops/story_3/beach_sunset.png",
        10 : 'assets/images/backdrops/story_3/beach_locked.png'},
      events: eventList,
      characters: characterList,
      initialPositions: characterList.map((character) => character.position).toList(),
      initialEmotions: characterList.map((character) => character.emotion).toList(),
    backgroundAudioPath: beachBackgroundAudioPath,
  );

}
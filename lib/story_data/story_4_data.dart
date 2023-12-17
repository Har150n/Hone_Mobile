import 'package:hone_mobile/model/story.dart';
import 'package:hone_mobile/model/character.dart';
import 'package:hone_mobile/model/event.dart';
import 'image_maps.dart';
import 'package:hone_mobile/model/question.dart';
import 'common_paths.dart';

// Story 4: Jimmy's Birthday!
class StoryDataFour {
  static List<Character> characterList = [
    Character(
        Id: "A",
        position: 8,
        emotion: 'happy_birthday',
        imageDict: mainBoyImageMap,
        enlarged: false),
    Character(
        Id: "B",
        position: 9,
        emotion: 'happy_birthday',
        imageDict: motherImageMap,
        enlarged: false),
    Character(
        Id: "C",
        position: -3,
        emotion: 'happy_birthday',
        imageDict: hannahMap,
        enlarged: false),
    Character(
        Id: "D",
        position: -2,
        emotion: 'happy_birthday',
        imageDict: harryMap,
        enlarged: false),
  ];
  static List<Event> eventList = [
    GeneralEvent(
        duration: Duration(seconds: 8),
        audioPath: "audio/narration/4/story_4_narration_1.mp3",
        animationInstruction: "A4 B5",
        emotionInstruction: "",
        enlargeInstruction: "",
        backgroundInstruction: -1),
    GeneralEvent(
        duration: Duration(seconds: 3),
        audioPath: "audio/narration/4/story_4_narration_2.m4a",
        animationInstruction: "",
        emotionInstruction: "",
        enlargeInstruction: "A",
        backgroundInstruction: -1),
    GeneralEvent(
        duration: Duration(seconds: 2),
        audioPath: "audio/narration/4/story_4_narration_3.mp3",
        animationInstruction: "",
        emotionInstruction: "",
        enlargeInstruction: "B",
        backgroundInstruction: -1),
    GeneralEvent(
        duration: Duration(seconds: 2),
        audioPath: "audio/narration/4/story_4_narration_4.m4a",
        animationInstruction: "",
        emotionInstruction: "",
        enlargeInstruction: "A",
        backgroundInstruction: -1),
    QuestionEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/4/story_4_narration_5.mp3",
        question: Question(emotions: ["Happy" , "Sad", "Angry", "Scared"], answer: "Happy")),
    GeneralEvent(
        duration: Duration(seconds: 2),
        audioPath: happyAudioPath,
        animationInstruction: "",
        emotionInstruction: "",
        enlargeInstruction: "",
        backgroundInstruction: -1),
    GeneralEvent(
        duration: Duration(seconds: 10),
        audioPath: "audio/narration/4/story_4_narration_7.mp3",
        animationInstruction: "A1",
        emotionInstruction: "Asad_birthday",
        enlargeInstruction: "",
        backgroundInstruction: -1),
    QuestionEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/4/story_4_narration_8.mp3",
        question: Question(emotions: ["Happy" , "Sad", "Angry", "Scared"], answer: "Sad")),
    GeneralEvent(
        duration: Duration(seconds: 2),
        audioPath: sadAudioPath,
        animationInstruction: "",
        emotionInstruction: "",
        enlargeInstruction: "",
        backgroundInstruction: -1),
    GeneralEvent(
        duration: Duration(seconds: 4),
        audioPath: "audio/narration/4/story_4_narration_10.mp3",
        animationInstruction: "A2",
        emotionInstruction: "",
        enlargeInstruction: "",
        backgroundInstruction: -1),
    GeneralEvent(
        duration: Duration(seconds: 4),
        audioPath: "audio/narration/4/story_4_narration_11.mp3",
        animationInstruction: "C1 D0",
        emotionInstruction: "",
        enlargeInstruction: "C",
        backgroundInstruction: -1),
    GeneralEvent(
        duration: Duration(seconds: 4),
        audioPath: "audio/narration/4/story_4_narration_12.mp3",
        animationInstruction: "",
        emotionInstruction: "Ahappy_birthday",
        enlargeInstruction: "",
        backgroundInstruction: -1),
    GeneralEvent(
        duration: Duration(seconds: 2),
        audioPath: "audio/narration/4/story_4_narration_13.m4a",
        animationInstruction: "",
        emotionInstruction: "",
        enlargeInstruction: "A",
        backgroundInstruction: -1),
    GeneralEvent(
        duration: Duration(seconds: 4),
        audioPath: "audio/narration/4/story_4_narration_14.mp3",
        animationInstruction: "",
        emotionInstruction: "",
        enlargeInstruction: "C",
        backgroundInstruction: -1),
    GeneralEvent(
        duration: Duration(seconds: 3),
        audioPath: "audio/narration/4/story_4_narration_15.m4a",
        animationInstruction: "A1 C2 D3 A4",
        emotionInstruction: "",
        enlargeInstruction: "A",
        backgroundInstruction: -1),
    QuestionEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/4/story_4_narration_16.mp3",
        question: Question(emotions: ["Happy" , "Sad", "Angry", "Scared"], answer: "Happy")),
    GeneralEvent(
        duration: Duration(seconds: 2),
        audioPath: happyAudioPath,
        animationInstruction: "",
        emotionInstruction: "",
        enlargeInstruction: "",
        backgroundInstruction: -1),
    GeneralEvent(
        duration: Duration(seconds: 6),
        audioPath: "audio/narration/4/story_4_narration_18.mp3",
        animationInstruction: "A4",
        emotionInstruction: "",
        enlargeInstruction: "",
        backgroundInstruction: -1),
    GeneralEvent(
        duration: Duration(seconds: 4),
        audioPath: "audio/narration/4/story_4_narration_19.m4a",
        animationInstruction: "",
        emotionInstruction: "",
        enlargeInstruction: "A",
        backgroundInstruction: -1),
    GeneralEvent(
        duration: Duration(seconds: 4),
        audioPath: "audio/narration/4/story_4_narration_20.mp3",
        animationInstruction: "",
        emotionInstruction: "",
        enlargeInstruction: "B",
        backgroundInstruction: -1),
    GeneralEvent(
        duration: Duration(seconds: 6),
        audioPath: "audio/narration/4/story_4_narration_21.mp3",
        animationInstruction: "C-2 D-2",
        emotionInstruction: "",
        enlargeInstruction: "",
        backgroundInstruction: -1),
    GeneralEvent(
        duration: Duration(seconds: 3),
        audioPath: "",
        animationInstruction: "A8 B8",
        emotionInstruction: "",
        enlargeInstruction: "",
        backgroundInstruction: -1),
  ];

  static Story story = Story(
      storyNum: 4,
      title: "Jimmy's Birthday!",
      backgroundImagePath: {
        1: 'assets/images/backdrops/story_4/living_room_cake.png',
        10: 'assets/images/backdrops/story_4/living_room_locked.png'
      },
      events: eventList,
      characters: characterList,
      initialPositions:
          characterList.map((character) => character.position).toList(),
      initialEmotions:
          characterList.map((character) => character.emotion).toList(),
    backgroundAudioPath: birthdayBackgroundAudioPath,);
}

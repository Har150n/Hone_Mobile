import 'package:hone_mobile/model/story.dart';
import 'package:hone_mobile/model/character.dart';
import 'package:hone_mobile/model/event.dart';
import 'image_maps.dart';
import 'package:hone_mobile/model/question.dart';
import 'common_paths.dart';

// Story 6: Classroom Introductions!
class StoryDataSix {
  static List<Character> characterList = [
    Character(Id: "A", position: -3, emotion: 'happy_cookie',
        imageDict: mainBoyImageMap, enlarged: false),
    Character(Id: "B", position: -2, emotion: 'happy',
        imageDict: msCharlotteMap, enlarged: false),
    Character(Id: "C", position: 8, emotion: 'happy',
        imageDict: millieMap, enlarged: false),
    Character(Id :"D", position: 8, emotion: 'happy',
        imageDict: harryMap, enlarged: false),
  ];
  static List<Event> eventList = [
    GeneralEvent(duration: Duration(seconds: 4), audioPath: "audio/narration/6/story_6_narration_1.mp3",
        animationInstruction: "A1 C4 D5 B6", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 3), audioPath: "audio/narration/6/story_6_narration_2.mp3",
        animationInstruction: "D2", emotionInstruction: "", enlargeInstruction: "D", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 3), audioPath: "audio/narration/6/story_6_narration_3.m4a",
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "A", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/6/story_6_narration_4.mp3",
        animationInstruction: "C3", emotionInstruction: "", enlargeInstruction: "C", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/6/story_6_narration_5.m4a",
        animationInstruction: "", emotionInstruction: "Ahappy", enlargeInstruction: "A", backgroundInstruction: -1),
    QuestionEvent(duration: Duration(seconds: 6), audioPath: "audio/narration/6/story_6_narration_6.mp3",
        question: Question(emotions: ["Happy" , "Sad", "Angry", "Scared"], answer: "Happy")),
    GeneralEvent(duration: Duration(seconds: 2), audioPath: happyAudioPath,
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 12), audioPath: "audio/narration/6/story_6_narration_8.mp3",
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "B", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 4), audioPath: "audio/narration/6/story_6_narration_9.mp3",
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "C", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 4), audioPath: "audio/narration/6/story_6_narration_10.mp3",
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "B", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 9), audioPath: "audio/narration/6/story_6_narration_11.mp3",
        animationInstruction: "", emotionInstruction: "Anervous", enlargeInstruction: "", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 4), audioPath: "audio/narration/6/story_6_narration_12.mp3",
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "D", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 1), audioPath: "audio/narration/6/story_6_narration_13.mp3",
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "B", backgroundInstruction: -1),
    QuestionEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/6/story_6_narration_14.mp3",
        question: Question(emotions: ["Happy" , "Sad", "Angry", "Nervous"], answer: "Nervous")),
    GeneralEvent(duration: Duration(seconds: 2), audioPath: nervousAudioPath,
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 8), audioPath: "audio/narration/6/story_6_narration_16.m4a",
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "A", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 3), audioPath: "audio/narration/6/story_6_narration_17.mp3",
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "B", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 3), audioPath: "audio/narration/6/story_6_narration_18.mp3",
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 12), audioPath: "audio/narration/6/story_6_narration_19.m4a",
        animationInstruction: "", emotionInstruction: "Ahappy", enlargeInstruction: "A", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 5), audioPath: "audio/narration/6/story_6_narration_20.mp3",
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "B", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/6/story_6_narration_21.mp3",
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "D", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/6/story_6_narration_22.mp3",
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "C", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/6/story_6_narration_23.m4a",
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "A", backgroundInstruction: -1),
    QuestionEvent(duration: Duration(seconds: 7), audioPath: "audio/narration/6/story_6_narration_24.mp3",
        question: Question(emotions: ["Happy" , "Sad", "Angry", "Nervous"], answer: "Happy")),
    GeneralEvent(duration: Duration(seconds: 2), audioPath: happyAudioPath,
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 9), audioPath: "audio/narration/6/story_6_narration_26.mp3",
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 2), audioPath: "",
        animationInstruction: "A8 B8 C8 D8", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),


  ];

  static Story story =
  Story(storyNum: 6, title: 'Class Introductions!',
      backgroundImagePath:
      {1: 'assets/images/backdrops/story_5/classroom.png',
        10: 'assets/images/backdrops/story_5/classroom_locked.png'
      },
      events: eventList,
      characters: characterList,
      initialPositions: characterList.map((character) => character.position).toList(),
      initialEmotions: characterList.map((character) => character.emotion).toList(),
    backgroundAudioPath: classroomBackgroundAudioPath,
  );

}
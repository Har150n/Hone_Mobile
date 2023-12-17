import 'package:hone_mobile/model/story.dart';
import 'package:hone_mobile/model/character.dart';
import 'package:hone_mobile/model/event.dart';
import 'image_maps.dart';
import 'package:hone_mobile/model/question.dart';
import 'common_paths.dart';

// Story 7: Painting Class Accident
class StoryDataSeven {
  static List<Character> characterList = [
    Character(Id: "A", position: -3, emotion: 'happy',
        imageDict: mainBoyImageMap, enlarged: false),
    Character(Id: "B", position: -2, emotion: 'happy',
        imageDict: msCharlotteMap, enlarged: false),
    Character(Id: "C", position: 8, emotion: 'happy',
        imageDict: harryMap, enlarged: false),
    Character(Id :"D", position: 8, emotion: 'happy',
        imageDict: hannahMap, enlarged: false),
  ];
  static List<Event> eventList = [
    GeneralEvent(duration: Duration(seconds: 5), audioPath: "audio/narration/7/story_7_narration_1.mp3",
        animationInstruction: "A0 B6 C2 D3", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 10), audioPath: "audio/narration/7/story_7_narration_2.mp3",
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "B", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 4), audioPath: "audio/narration/7/story_7_narration_3.m4a",
        animationInstruction: "A5", emotionInstruction: "", enlargeInstruction: "A", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 6), audioPath: "audio/narration/7/story_7_narration_4.mp3",
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "B", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 1), audioPath: "audio/narration/7/story_7_narration_5.m4a",
        animationInstruction: "", emotionInstruction: "Ahappy_blue_paint", enlargeInstruction: "A", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 4), audioPath: "audio/narration/7/story_7_narration_6.mp3",
        animationInstruction: "A1", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 5), audioPath: "audio/narration/7/story_7_narration_7.mp3",
        animationInstruction: "", emotionInstruction: "Csad_paint_shirt", enlargeInstruction: "", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 3), audioPath: "audio/narration/7/story_7_narration_8.m4a",
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "A", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 4), audioPath: "audio/narration/7/story_7_narration_9.mp3",
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "C", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 3), audioPath: "audio/narration/7/story_7_narration_10.m4a",
        animationInstruction: "", emotionInstruction: "Ascared", enlargeInstruction: "A", backgroundInstruction: -1),
    QuestionEvent(duration: Duration(seconds: 4), audioPath: "audio/narration/7/story_7_narration_11.mp3",
        question: Question(emotions: ["Happy" , "Sad", "Angry", "Scared"], answer: "Scared")),
    GeneralEvent(duration: Duration(seconds: 2), audioPath: scaredAudioPath,
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 5), audioPath: "audio/narration/7/story_7_narration_13.mp3",
        animationInstruction: "C5", emotionInstruction: "", enlargeInstruction: "C", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 9), audioPath: "audio/narration/7/story_7_narration_14.mp3",
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "B", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/7/story_7_narration_15.mp3",
        animationInstruction: "", emotionInstruction: "Chappy", enlargeInstruction: "C", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 6), audioPath: "audio/narration/7/story_7_narration_16.mp3",
        animationInstruction: "C2", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 6), audioPath: "audio/narration/7/story_7_narration_17.mp3",
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "C", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 7), audioPath: "audio/narration/7/story_7_narration_18.m4a",
        animationInstruction: "", emotionInstruction: "Ahappy_blue_paint", enlargeInstruction: "A", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 1), audioPath: "audio/narration/7/story_7_narration_19.mp3",
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "C", backgroundInstruction: -1),
    QuestionEvent(duration: Duration(seconds: 3), audioPath: "audio/narration/7/story_7_narration_20.mp3",
        question: Question(emotions: ["Happy" , "Sad", "Angry", "Scared"], answer: "Happy")),
    GeneralEvent(duration: Duration(seconds: 2), audioPath: happyAudioPath,
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 14), audioPath: "audio/narration/7/story_7_narration_22.mp3",
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 2), audioPath: "",
        animationInstruction: "A8 B8 C8 D8", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),





  ];

  static Story story =
  Story(storyNum: 7, title: 'Painting Class!',
      backgroundImagePath:
      { 1 : 'assets/images/backdrops/story_7/classroom_paint.png',
        10: 'assets/images/backdrops/story_7/classroom_paint_locked.png'
      },
      events: eventList,
      characters: characterList,
      initialPositions: characterList.map((character) => character.position).toList(),
      initialEmotions: characterList.map((character) => character.emotion).toList(),
    backgroundAudioPath: classroomBackgroundAudioPath,
  );

}
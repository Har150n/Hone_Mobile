import 'package:hone_mobile/model/story.dart';
import 'package:hone_mobile/model/character.dart';
import 'package:hone_mobile/model/event.dart';
import 'image_maps.dart';
import 'package:hone_mobile/model/question.dart';
import 'common_paths.dart';

// Story 5: First day of School!
class StoryDataFive {
  static List<Character> characterList = [
    Character(Id: "A", position: -3, emotion: 'happy',
        imageDict: mainBoyImageMap, enlarged: false),
    Character(Id: "B", position: -2, emotion: 'happy',
        imageDict: motherImageMap, enlarged: false),
    Character(Id: "C", position: 8, emotion: 'happy',
        imageDict: msCharlotteMap, enlarged: false),
    Character(Id :"D", position: 8, emotion: 'happy',
        imageDict: harryMap, enlarged: false),
  ];
  static List<Event> eventList = [
    GeneralEvent(duration: Duration(seconds: 3), audioPath: "audio/narration/5/story_5_narration_1.mp3",
        animationInstruction: "A0 B1", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 4), audioPath: "audio/narration/5/story_5_narration_2.m4a",
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "A", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 4), audioPath: "audio/narration/5/story_5_narration_3.mp3",
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "B", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 3), audioPath: "audio/narration/5/story_5_narration_4.m4a",
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "A", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 4), audioPath: "audio/narration/5/story_5_narration_5.mp3",
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "B", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 3), audioPath: "audio/narration/5/story_5_narration_6.m4a",
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "A", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/5/story_5_narration_7.mp3",
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "B", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 7), audioPath: "audio/narration/5/story_5_narration_8.mp3",
        animationInstruction: "B8 A5", emotionInstruction: "Asad", enlargeInstruction: "", backgroundInstruction: -1),
    QuestionEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/5/story_5_narration_9.mp3",
        question: Question(emotions: ["Happy" , "Sad", "Angry", "Scared"], answer: "Sad")),
    GeneralEvent(duration: Duration(seconds: 2), audioPath: sadAudioPath,
        animationInstruction: "A0 C6 D4", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: 2),
    GeneralEvent(duration: Duration(seconds: 7), audioPath: "audio/narration/5/story_5_narration_11.mp3",
        animationInstruction: "", emotionInstruction: "Anervous", enlargeInstruction: "", backgroundInstruction: -1),
    QuestionEvent(duration: Duration(seconds: 2), audioPath:  "audio/narration/5/story_5_narration_12.mp3",
        question: Question(emotions: ["Happy" , "Sad", "Scared", "Nervous"], answer: "Nervous")),
    GeneralEvent(duration: Duration(seconds: 2), audioPath: nervousAudioPath,
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 3), audioPath: "audio/narration/5/story_5_narration_14.mp3",
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 5), audioPath: "audio/narration/5/story_5_narration_15.mp3",
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "C", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 3), audioPath: "audio/narration/5/story_5_narration_16.m4a",
        animationInstruction: "A5 D3", emotionInstruction: "", enlargeInstruction: "A", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 4), audioPath: "audio/narration/5/story_5_narration_17.mp3",
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "C", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 3), audioPath: "audio/narration/5/story_5_narration_18.m4a",
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "A", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 5), audioPath: "audio/narration/5/story_5_narration_19.mp3",
        animationInstruction: "A4", emotionInstruction: "Ahappy_cookie", enlargeInstruction: "", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 3), audioPath: "audio/narration/5/story_5_narration_20.m4a",
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "A", backgroundInstruction: -1),
    QuestionEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/5/story_5_narration_21.mp3",
        question: Question(emotions: ["Happy" , "Sad", "Angry", "Scared"], answer: "Happy")),
    GeneralEvent(duration: Duration(seconds: 2), audioPath: happyAudioPath,
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 5), audioPath: "audio/narration/5/story_5_narration_23.mp3",
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 2), audioPath: "",
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),




  ];

  static Story story =
  Story(storyNum: 5, title: 'First Day of School!',
      backgroundImagePath:
      { 1 : 'assets/images/backdrops/story_5/living_room.png',
        2: 'assets/images/backdrops/story_5/classroom.png',
        10: 'assets/images/backdrops/story_5/classroom_locked.png'
        },
      events: eventList,
      characters: characterList,
      initialPositions: characterList.map((character) => character.position).toList(),
      initialEmotions: characterList.map((character) => character.emotion).toList(),
    backgroundAudioPath: classroomBackgroundAudioPath,
  );

}
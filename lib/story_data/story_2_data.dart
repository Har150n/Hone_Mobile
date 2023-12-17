import 'package:hone_mobile/model/story.dart';
import 'package:hone_mobile/model/character.dart';
import 'package:hone_mobile/model/event.dart';
import 'image_maps.dart';
import 'package:hone_mobile/model/question.dart';
import 'common_paths.dart';

// Story 2: Amusement Park
class StoryDataTwo {
    static List<Character> characterList = [
      Character(Id: "A", position: -3, emotion: 'happy',
          imageDict: mainBoyImageMap, enlarged: false),
      Character(Id: "B", position: -2, emotion: 'happy',
          imageDict: motherImageMap, enlarged: false),
      Character(Id: "C", position: 8, emotion: 'happy',
          imageDict: rollerCoasterManMap, enlarged: false),
      Character(Id :"D", position: -5, emotion: 'happy',
          imageDict: nikkiMap, enlarged: false),
    ];
    static List<Event> eventList = [
      GeneralEvent(duration: Duration(seconds: 6), audioPath: "audio/narration/2/story_2_narration_1.mp3",
        animationInstruction: "A0 B1 C5", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 7), audioPath: "audio/narration/2/story_2_narration_2.m4a",
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: "A", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 3), audioPath: "audio/narration/2/story_2_narration_3.mp3",
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: "B", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/2/story_2_narration_4.m4a",
          animationInstruction: "A4", emotionInstruction: "", enlargeInstruction: "A", backgroundInstruction: -1),
      QuestionEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/2/story_2_narration_5.mp3",
     question: Question(emotions: ["Happy" , "Sad", "Angry", "Scared"], answer: "Happy")),
      GeneralEvent(duration: Duration(seconds: 2), audioPath: happyAudioPath,
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 7), audioPath: "audio/narration/2/story_2_narration_7.mp3",
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: "C", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 3), audioPath: "audio/narration/2/story_2_narration_8.m4a",
          animationInstruction: "", emotionInstruction: "Asad", enlargeInstruction: "A", backgroundInstruction: -1),
      QuestionEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/2/story_2_narration_9.mp3",
          question: Question(emotions: ["Happy" , "Sad", "Angry", "Scared"], answer: "Sad")),
      GeneralEvent(duration: Duration(seconds: 2), audioPath: sadAudioPath,
          animationInstruction: "C8 D3", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 4), audioPath: "audio/narration/2/story_2_narration_11.mp3",
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: "D", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 4), audioPath: "audio/narration/2/story_2_narration_12.m4a",
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: "A", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 3), audioPath: "audio/narration/2/story_2_narration_13.mp3",
          animationInstruction: "", emotionInstruction: "Ahappy", enlargeInstruction: "B", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 2), audioPath: "",
          animationInstruction: "A3 D5 B8 C8", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: 2),
      GeneralEvent(duration: Duration(seconds: 5), audioPath: "audio/narration/2/story_2_narration_14.m4a",
          animationInstruction: "", emotionInstruction: "Ascared", enlargeInstruction: "A", backgroundInstruction: -1),
      QuestionEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/2/story_2_narration_15.mp3",
          question: Question(emotions: ["Happy" , "Sad", "Angry", "Scared"], answer: "Scared")),
      GeneralEvent(duration: Duration(seconds: 2), audioPath: scaredAudioPath,
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 3), audioPath: "audio/narration/2/story_2_narration_17.mp3",
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: "D", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 3), audioPath: "audio/narration/2/story_2_narration_18.m4a",
          animationInstruction: "D8", emotionInstruction: "Athinking", enlargeInstruction: "A", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 11), audioPath: "audio/narration/2/story_2_narration_19.mp3",
          animationInstruction: "B4", emotionInstruction: "Bhappy_teddy_bear", enlargeInstruction: "", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 3), audioPath: "audio/narration/2/story_2_narration_20.mp3",
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: "B", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 3), audioPath: "audio/narration/2/story_2_narration_21.m4a",
          animationInstruction: "", emotionInstruction: "Ahappy", enlargeInstruction: "A", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 3), audioPath: "audio/narration/2/story_2_narration_22.mp3",
          animationInstruction: "", emotionInstruction: "Ahappy_teddy_bear Bhappy", enlargeInstruction: "B", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 3), audioPath: "audio/narration/2/story_2_narration_23.m4a",
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: "A", backgroundInstruction: -1),
      QuestionEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/2/story_2_narration_24.mp3",
          question: Question(emotions: ["Happy" , "Sad", "Angry", "Scared"], answer: "Happy")),
      GeneralEvent(duration: Duration(seconds: 2), audioPath: happyAudioPath,
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 6), audioPath: "audio/narration/2/story_2_narration_26.mp3",
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 2), audioPath: "",
          animationInstruction: "A8 B8", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),




    ];

    static Story story =
      Story(storyNum: 2, title: 'Amusement Park',
      backgroundImagePath:
      { 1 : 'assets/images/backdrops/story_2/rollercoaster.png',
        2 : "assets/images/backdrops/story_2/water_slide.png",
      10 : 'assets/images/backdrops/story_2/rollercoaster_locked.png'},
      events: eventList,
      characters: characterList,
          initialPositions: characterList.map((character) => character.position).toList(),
          initialEmotions: characterList.map((character) => character.emotion).toList(),
        backgroundAudioPath: amusementParkBackgroundAudioPath,
      );

}
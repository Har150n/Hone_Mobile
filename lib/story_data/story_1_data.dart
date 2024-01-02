import 'package:hone_mobile/model/story.dart';
import 'package:hone_mobile/model/character.dart';
import 'package:hone_mobile/model/event.dart';
import 'image_maps.dart';
import 'package:hone_mobile/model/question.dart';
import 'common_paths.dart';

class StoryDataOne {
    static List<Character> characterList = [
      Character(Id: "A", position: -3, emotion: 'happy',
          imageDict: mainBoyImageMap, enlarged: false),
      Character(Id: "B", position: -2, emotion: 'happy',
          imageDict: motherImageMap, enlarged: false),
      Character(Id: "C", position: 8, emotion: 'happy',
          imageDict: iceCreamManMap, enlarged: false),
    ];
    static List<Event> eventList = [
      GeneralEvent(duration: Duration(seconds: 5), audioPath: "audio/narration/1/story_1_narration_1.mp3",
        animationInstruction: "A0 B1 C5", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_2.m4a",
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: "A", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_3.m4a",
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: "A", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 1), audioPath: "audio/narration/1/story_1_narration_4.mp3",
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: "B", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_5.mp3",
          animationInstruction: "", emotionInstruction: "Ahappy", enlargeInstruction: "B", backgroundInstruction: -1),
      QuestionEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_6.mp3",
          question: Question(emotions: ["Happy" , "Sad", "Angry", "Scared"], answer: "Happy")),
      GeneralEvent(duration: Duration(seconds: 2), audioPath: happyAudioPath,
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 3), audioPath: "audio/narration/1/story_1_narration_8.m4a",
          animationInstruction: "A3", emotionInstruction: "", enlargeInstruction: "A", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_9.mp3",
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: "C", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_10.m4a",
          animationInstruction: "", emotionInstruction: "Asad", enlargeInstruction: "A", backgroundInstruction: -1),
      QuestionEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_11.mp3",
          question: Question(emotions: ["Happy" , "Sad", "Angry", "Scared"], answer: "Sad")),
      GeneralEvent(duration: Duration(seconds: 2), audioPath: sadAudioPath,
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 4), audioPath: "audio/narration/1/story_1_narration_13.mp3",
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 6), audioPath: "audio/narration/1/story_1_narration_14.mp3",
          animationInstruction: "", emotionInstruction: "Chappy_ice_cream", enlargeInstruction: "C", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 3), audioPath: "audio/narration/1/story_1_narration_15.m4a",
          animationInstruction: "", emotionInstruction: "Ahappy_ice_cream Chappy", enlargeInstruction: "A", backgroundInstruction: -1),
      QuestionEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_16.mp3",
          question: Question(emotions: ["Happy" , "Sad", "Angry", "Scared"], answer: "Happy")),
      GeneralEvent(duration: Duration(seconds: 2), audioPath: happyAudioPath,
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 9), audioPath: "audio/narration/1/story_1_narration_18.mp3",
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_19.m4a",
          animationInstruction: "", emotionInstruction: "Asad", enlargeInstruction: "A", backgroundInstruction: -1),
      QuestionEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_20.mp3",
          question: Question(emotions: ["Happy" , "Sad", "Angry", "Scared"], answer: "Sad")),
      GeneralEvent(duration: Duration(seconds: 2), audioPath: sadAudioPath,
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_22.mp3",
          animationInstruction: "A0", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 4), audioPath: "audio/narration/1/story_1_narration_23.m4a",
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: "A", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 5), audioPath: "audio/narration/1/story_1_narration_24.mp3",
          animationInstruction: "", emotionInstruction: "Asad", enlargeInstruction: "B", backgroundInstruction: -1),
      QuestionEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_25.mp3",
          question: Question(emotions: ["Happy" , "Sad", "Angry", "Scared"], answer: "Sad")),
      GeneralEvent(duration: Duration(seconds: 2), audioPath: sadAudioPath,
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 10), audioPath: "audio/narration/1/story_1_narration_27.mp3",
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 2), audioPath: "",
          animationInstruction: "A8 B8 C8", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
    ];

    static Story story =
      Story(storyNum: 1, title: 'Ice Cream in the Park',
      backgroundImagePath: {1: 'assets/images/backdrops/story_1/park2.jpg',
      10: 'assets/images/backdrops/story_1/park_locked.png'},
      events: eventList,
      characters: characterList,
          initialPositions: characterList.map((character) => character.position).toList(),
          initialEmotions: characterList.map((character) => character.emotion).toList(),
        backgroundAudioPath: parkBackgroundAudioPath,
      );

}
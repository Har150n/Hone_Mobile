import '../model/story.dart';
import '../model/character.dart';
import '../model/event.dart';
import 'image_maps.dart';
import '../model/question.dart';

class StoryDataOne {
    static List<Character> characterList = [
      Character(Id: "A", position: -3, emotion: 'happy',
          imageDict: mainBoyImageMap, enlarged: false),
      Character(Id: "B", position: -2, emotion: 'happy',
          imageDict: motherImageMap, enlarged: false),
      Character(Id: "C", position: 8, emotion: 'happy',
          imageDict: iceCreamManMap, enlarged: false),
      Character(Id :"D", position: -5, emotion: 'happy',
          imageDict: {'happy': 'assets/images/characters/placeholder.png'}, enlarged: false),
    ];
    static List<Event> eventList = [
      GeneralEvent(duration: Duration(seconds: 5), audioPath: "audio/narration/1/story_1_narration_1.mp3",
        animationInstruction: "A0B1C5", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_2.mp3",
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: "A", backgroundInstruction: 2),
      GeneralEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_3.mp3",
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: "A", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_4.mp3",
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: "B", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_5.mp3",
          animationInstruction: "", emotionInstruction: "Ahappy", enlargeInstruction: "B", backgroundInstruction: -1),
      QuestionEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_6.mp3",
          question: Question(emotions: ["Happy" , "Sad", "Angry", "Scared"], answer: "Happy")),
      GeneralEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_7.mp3",
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_8.mp3",
          animationInstruction: "A3", emotionInstruction: "", enlargeInstruction: "A", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_9.mp3",
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: "C", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_10.mp3",
          animationInstruction: "", emotionInstruction: "Asad", enlargeInstruction: "A", backgroundInstruction: -1),
      QuestionEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_11.mp3",
          question: Question(emotions: ["Happy" , "Sad", "Angry", "Scared"], answer: "Sad")),
      GeneralEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_12.mp3",
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_13.mp3",
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_14.mp3",
          animationInstruction: "", emotionInstruction: "Chappy_ice_cream", enlargeInstruction: "C", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_15.mp3",
          animationInstruction: "", emotionInstruction: "Ahappy_ice_cream Chappy", enlargeInstruction: "A", backgroundInstruction: -1),
      QuestionEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_16.mp3",
          question: Question(emotions: ["Happy" , "Sad", "Angry", "Scared"], answer: "Happy")),
      GeneralEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_17.mp3",
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_18.mp3",
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_19.mp3",
          animationInstruction: "", emotionInstruction: "Asad", enlargeInstruction: "A", backgroundInstruction: -1),
      QuestionEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_20.mp3",
          question: Question(emotions: ["Happy" , "Sad", "Angry", "Scared"], answer: "Sad")),
      GeneralEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_21.mp3",
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_22.mp3",
          animationInstruction: "A0", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_23.mp3",
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: "A", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_24.mp3",
          animationInstruction: "", emotionInstruction: "Asad", enlargeInstruction: "B", backgroundInstruction: -1),
      QuestionEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_25.mp3",
          question: Question(emotions: ["Happy" , "Sad", "Angry", "Scared"], answer: "Sad")),
      GeneralEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_26.mp3",
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_27.mp3",
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 2), audioPath: "",
          animationInstruction: "A8B8C8", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
    ];

    static Story story =
      Story(storyNum: 1, title: 'Ice Cream in the Park',
      backgroundImagePath: {1: 'assets/images/backdrops/story_1/park2.jpg'},
      events: eventList,
      characters: characterList,
          initialPositions: characterList.map((character) => character.position).toList(),
          initialEmotions: characterList.map((character) => character.emotion).toList()
      );

}
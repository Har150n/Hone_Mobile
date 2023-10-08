import '../model/story.dart';
import '../model/character.dart';
import '../model/event.dart';

class StoryController {
    static List<Character> characterList = [
      Character(Id: "A", position: -3, emotion: 'default',
          imageDict: {'default': 'assets/images/characters/boy_thinking.png',
            'happy': 'assets/images/characters/boy_happy.png',
            'nervous': 'assets/images/characters/boy_nervous.png',
            'sad': 'assets/images/characters/boy_sad.png',
            'angry': 'assets/images/characters/boy_angry.png',
            'fear': 'assets/images/characters/boy_fear.png'
          }, enlarged: false),
      Character(Id: "B", position: -2, emotion: 'default',
          imageDict: {"default": 'assets/images/characters/mother_ice_cream.png'}, enlarged: false),
      Character(Id: "C", position: 8, emotion: 'default',
          imageDict: {'default': 'assets/images/characters/ice_cream_man.png'}, enlarged: false),
      Character(Id :"D", position: -5, emotion: 'default',
          imageDict: {'default': 'assets/images/characters/ice_cream_man.png'}, enlarged: false),
    ];
    static List<Event> eventList = [
      Event(duration: Duration(seconds: 5), audioPath: "audio/narration/1/story_1_narration_1.mp3", isQuestionEvent: false,
        animationInstruction: "A0B1C5", emotionInstruction: "", enlargeInstruction: ""),
      Event(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_2.mp3", isQuestionEvent: false,
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: "A"),
      Event(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_3.mp3", isQuestionEvent: false,
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: "A"),
      Event(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_4.mp3", isQuestionEvent: false,
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: "B"),
      Event(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_5.mp3", isQuestionEvent: false,
          animationInstruction: "", emotionInstruction: "Ahappy", enlargeInstruction: "B"),
      Event(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_6.mp3", isQuestionEvent: false,
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: ""),
      Event(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_7.mp3", isQuestionEvent: false,
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: ""),
      Event(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_8.mp3", isQuestionEvent: false,
          animationInstruction: "A3", emotionInstruction: "", enlargeInstruction: "A"),
      Event(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_9.mp3", isQuestionEvent: false,
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: "C"),
      Event(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_10.mp3", isQuestionEvent: false,
          animationInstruction: "", emotionInstruction: "Asad", enlargeInstruction: "A"),
      Event(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_11.mp3", isQuestionEvent: false,
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: ""),
      Event(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_12.mp3", isQuestionEvent: false,
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: ""),
      Event(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_13.mp3", isQuestionEvent: false,
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: ""),
      Event(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_14.mp3", isQuestionEvent: false,
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: "C"),
      Event(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_15.mp3", isQuestionEvent: false,
          animationInstruction: "", emotionInstruction: "Ahappy", enlargeInstruction: "A"),
      Event(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_16.mp3", isQuestionEvent: false,
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: ""),
      Event(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_17.mp3", isQuestionEvent: false,
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: ""),
      Event(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_18.mp3", isQuestionEvent: false,
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: ""),
      Event(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_19.mp3", isQuestionEvent: false,
          animationInstruction: "", emotionInstruction: "Asad", enlargeInstruction: "A"),
      Event(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_20.mp3", isQuestionEvent: false,
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: ""),
      Event(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_21.mp3", isQuestionEvent: false,
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: ""),
      Event(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_22.mp3", isQuestionEvent: false,
          animationInstruction: "A0", emotionInstruction: "", enlargeInstruction: ""),
      Event(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_23.mp3", isQuestionEvent: false,
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: "A"),
      Event(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_24.mp3", isQuestionEvent: false,
          animationInstruction: "", emotionInstruction: "Asad", enlargeInstruction: "B"),
      Event(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_25.mp3", isQuestionEvent: false,
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: ""),
      Event(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_26.mp3", isQuestionEvent: false,
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: ""),
      Event(duration: Duration(seconds: 2), audioPath: "audio/narration/1/story_1_narration_27.mp3", isQuestionEvent: false,
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: ""),
      Event(duration: Duration(seconds: 2), audioPath: "", isQuestionEvent: false,
          animationInstruction: "A8B8C8", emotionInstruction: "", enlargeInstruction: ""),
    ];

    static Map<String, Story> storyMap = {
      "Ice Cream in the Park":
      Story(storyNum: 1, title: 'Ice Cream in the Park',
      backgroundImagePath: 'assets/images/stories/park2.jpg',
      events: eventList,
      characters: characterList,
          initialPositions: characterList.map((character) => character.position).toList(),
          initialEmotions: characterList.map((character) => character.emotion).toList()
      )
    };

}
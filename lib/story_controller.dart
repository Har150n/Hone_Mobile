import 'story.dart';
import 'character.dart';
import 'event.dart';

class StoryController {
    static List<Character> characterList = [
      Character(Id: "A", position: -2, emotion: 'default',
          imageDict: {'default': 'assets/images/characters/boy_thinking.png',
            'happy': 'assets/images/characters/boy_happy.png',
            'nervous': 'assets/images/characters/boy_nervous.png'}),
      Character(Id: "B", position: 1, emotion: 'default',
          imageDict: {"default": 'assets/images/characters/mother_ice_cream.png'}),
      Character(Id: "C", position: 6, emotion: 'default',
          imageDict: {'default': 'assets/images/characters/ice_cream_man.png'}),
    ];
    static List<Event> eventList = [
      Event(duration: Duration(seconds: 5), audioPath: "audio/narration_1_1.mp3", isQuestionEvent: false,
        animationInstruction: "A2", emotionInstruction: "Ahappy"),
      Event(duration: Duration(seconds: 5), audioPath: "", isQuestionEvent: false, animationInstruction: "B3",
      emotionInstruction: "Anervous"),
      Event(duration: Duration(seconds: 5), audioPath: "", isQuestionEvent: true, animationInstruction: "",
          emotionInstruction: ""),
    ];

    static Map<String, Story> storyMap = {
      "Ice Cream in the Park":
      Story(storyNum: 1, title: 'Ice Cream in the Park',
      backgroundImagePath: 'assets/images/stories/park.jpg',
      events: eventList,
      characters: characterList,
          initialPositions: characterList.map((character) => character.position).toList(),
          initialEmotions: characterList.map((character) => character.emotion).toList()
      )
    };

}
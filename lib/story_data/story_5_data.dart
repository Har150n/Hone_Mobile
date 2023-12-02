import '../model/story.dart';
import '../model/character.dart';
import '../model/event.dart';
import 'image_maps.dart';
import '../model/question.dart';

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
    GeneralEvent(duration: Duration(seconds: 5), audioPath: "audio/narration/5/story_5_narration_1.mp3",
        animationInstruction: "A0B1C3", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 3), audioPath: "audio/narration/5/story_5_narration_2.mp3",
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "A", backgroundInstruction: -1),
    GeneralEvent(duration: Duration(seconds: 3), audioPath: "audio/narration/5/story_5_narration_3.mp3",
        animationInstruction: "", emotionInstruction: "", enlargeInstruction: "B", backgroundInstruction: -1),

  ];

  static Story story =
  Story(storyNum: 5, title: 'First Day of School!',
      backgroundImagePath:
      { 1 : 'assets/images/backdrops/story_5/living_room.png',
        2: 'assets/images/backdrops/story_5/classroom.png',
        },
      events: eventList,
      characters: characterList,
      initialPositions: characterList.map((character) => character.position).toList(),
      initialEmotions: characterList.map((character) => character.emotion).toList(),
    coverBackgroundIndex: 2
  );

}
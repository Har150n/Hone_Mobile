import '../model/story.dart';
import '../model/character.dart';
import '../model/event.dart';
import 'image_maps.dart';
import '../model/question.dart';

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
          imageDict: hannahMap, enlarged: false),
    ];
    static List<Event> eventList = [
      GeneralEvent(duration: Duration(seconds: 5), audioPath: "audio/narration/2/story_2_narration_1.mp3",
        animationInstruction: "A0B1C3", emotionInstruction: "", enlargeInstruction: "", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 3), audioPath: "audio/narration/2/story_2_narration_2.mp3",
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: "A", backgroundInstruction: -1),
      GeneralEvent(duration: Duration(seconds: 3), audioPath: "audio/narration/2/story_2_narration_3.mp3",
          animationInstruction: "", emotionInstruction: "", enlargeInstruction: "B", backgroundInstruction: -1),

    ];

    static Story story =
      Story(storyNum: 2, title: 'Amusement Park',
      backgroundImagePath:
      { 1 : 'assets/images/backdrops/story_2/rollercoaster.png',
        2 : "assets/images/backdrops/story_2/water_slide.png"},
      events: eventList,
      characters: characterList,
          initialPositions: characterList.map((character) => character.position).toList(),
          initialEmotions: characterList.map((character) => character.emotion).toList()
      );

}
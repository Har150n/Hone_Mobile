import 'character.dart';
import 'event.dart';

class Story {
  int storyNum;
  String title;
  Map<int, String> backgroundImagePath;

  List<Event> events;
  List<Character> characters;
  final List<int> initialPositions;
  final List<String> initialEmotions;
  // determines background for story selection page (defaults to 1)
  int coverBackgroundIndex;

  Story({required this.storyNum,required this.title,
    required this.backgroundImagePath, required this.events,
    required this.characters, required this.initialPositions,
    required this.initialEmotions, this.coverBackgroundIndex = 1});

  List<Event> getEvents() {
    return events;
  }

  String getBackgroundImagePath(int index) {
    if (backgroundImagePath.containsKey(index)) {
      return backgroundImagePath[index] as String;
    } else {
      throw "background does not exist at index";
    }
  }

  String getTitle() {
    return title;
  }


}


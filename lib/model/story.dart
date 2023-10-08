import 'package:flutter/cupertino.dart';
import 'character.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'event.dart';

class Story {
  int storyNum;
  String title;
  String backgroundImagePath;
  Map<String, String> mainBoyImageMap = {
    'happy': 'assets/images/characters/boy_happy.png',
    'angry': 'assets/images/characters/boy_angry.png',
    'excited': 'assets/images/characters/boy_excited.png',
    'fear': 'assets/images/characters/boy_fear.png',
    'nervous': 'assets/images/characters/boy_nervous.png',
    'proud': 'assets/images/characters/boy_proud.png',
    'sad': 'assets/images/characters/boy_sad.png',
    'thinking': 'assets/images/characters/boy_thinking.png',
  };

  List<Event> events;
  List<Character> characters;
  final List<int> initialPositions;
  final List<String> initialEmotions;
  Story({required this.storyNum,required this.title,
    required this.backgroundImagePath, required this.events,
    required this.characters, required this.initialPositions,
    required this.initialEmotions});

}


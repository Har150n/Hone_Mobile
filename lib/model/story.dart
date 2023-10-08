import 'package:flutter/cupertino.dart';
import 'character.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'event.dart';

class Story {
  int storyNum;
  String title;
  String backgroundImagePath;

  List<Event> events;
  List<Character> characters;
  final List<int> initialPositions;
  final List<String> initialEmotions;
  Story({required this.storyNum,required this.title,
    required this.backgroundImagePath, required this.events,
    required this.characters, required this.initialPositions,
    required this.initialEmotions});

}


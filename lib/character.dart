import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Character{
  final String Id;
  int position;
  String emotion;
  Map<String, String> imageDict; //dicoitnary mapping emotion to imagePath
  late String imagePath;

  Character({
    required this.Id,
    required this.position,
    required this.emotion,
    required this.imageDict,

  }) {
    if (imageDict.containsKey(this.emotion)) {
      imagePath = imageDict[this.emotion]!;
    } else {
      imagePath = 'image does not exist';
    }

  }

  void setImagePath() {
    this.imagePath = this.imageDict[this.emotion]!;
  }

}
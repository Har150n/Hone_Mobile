import 'package:flutter/material.dart';

class QuestionPage extends StatefulWidget {
  String emotion;
  var emotionOptions =
  ["happy", "sad", "excited", "nervous", "fear", "thinking", "angry", "proud"];
  QuestionPage(this.emotion);

  @override
  _QuestionPageState createState() {
    return _QuestionPageState();
  }

}

// TODO: Build question page (40 minutes)
// TODO: Add answer checking functinality to question page (40 minutes)
class _QuestionPageState extends State<QuestionPage> {
  @override
  Widget build(BuildContext context) {
    return Text("This is the question page");
  }
}
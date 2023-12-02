// Holds event data
// If audioPath is null, no sound is played
// If animationInstruction is null, no animation is done
// If emotionInstruction is null, no image is changed
import 'question.dart';

class Event {
  Event({
    required this.duration,
    required this.audioPath,
  });
  Duration duration;
  String audioPath;
}

class QuestionEvent extends Event {
  QuestionEvent({
    required Duration duration,
    required String audioPath,
    required this.question,
  }) : super(
          duration: duration,
          audioPath: audioPath,
        );
  Question question;
}

class GeneralEvent extends Event {
  GeneralEvent({
    required Duration duration,
    required String audioPath,
    required this.animationInstruction,
    required this.emotionInstruction,
    required this.enlargeInstruction,
    required this.backgroundInstruction,
}) : super(
    duration: duration,
    audioPath: audioPath,
  );
  String
  animationInstruction; // Ex: "A0B1C5"     -> moves character A to position 0, B to position, ...
  String
  emotionInstruction; // Ex: "Anervous" "Anervous Bhappy_ice_cream   -> makes character A's image nervous
  String
  enlargeInstruction; // Ex: "A"          -> indicate character(s) is speaking
  int
  backgroundInstruction;

}

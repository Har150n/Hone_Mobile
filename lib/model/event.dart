
// Holds event data
// If audioPath is null, no sound is played
// If animationInstruction is null, no animation is done
// If emotionInstruction is null, no image is changed
class Event {
  Event ({
    required this.duration,
    required this.audioPath,
    required this.isQuestionEvent,
    required this.animationInstruction,
    required this.emotionInstruction,
    required this.enlargeInstruction,
});
  Duration duration;
  String audioPath;
  bool isQuestionEvent;         //
  String animationInstruction;  // Ex: "A0B1C5"     -> moves character A to position 0, B to position, ...
  String emotionInstruction;    // Ex: "Anervous"   -> makes character A's image nervous
  String enlargeInstruction;    // Ex: "A"          -> indicate character(s) is speaking


}
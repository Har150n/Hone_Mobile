
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
});
  Duration duration;
  String audioPath;
  bool isQuestionEvent;
  String animationInstruction;
  String emotionInstruction;


}
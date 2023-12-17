
// Represents the data inside a question
class Question {
  final List<String> emotions;
  final String answer;

  Question({required this.emotions ,required this.answer});

  String getAnswer() {
    return answer;
  }

  List<String> getEmotions() {
    return emotions;
  }

}

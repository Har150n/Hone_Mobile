class ParentQuestion {
  final String question;
  final List<String> options;
  final String answer;

  ParentQuestion(
      {required this.question, required this.options, required this.answer}) {}
}

List<ParentQuestion> parentQuestionBank = [
  ParentQuestion(
    question: 'What is the capital of Italy?',
    options: ['Paris', 'Rome', 'Berlin', 'Madrid'],
    answer: 'Rome',
  ),
  ParentQuestion(
    question: 'Which planet is known as the Red Planet?',
    options: ['Earth', 'Mars', 'Venus', 'Jupiter'],
    answer: 'Mars',
  ),
  ParentQuestion(
    question: 'What is the largest ocean on Earth?',
    options: ['Atlantic', 'Indian', 'Southern', 'Pacific'],
    answer: 'Pacific',
  )];
import 'dart:math';
import 'package:hone_mobile/model/parent_question.dart';

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
  ),
  ParentQuestion(
    question: 'What does a VCR do?',
    options: ['Heat up food', 'Plays videos on tapes', 'Keeps cars safe', 'Heals rashes on the skin'],
    answer: 'Plays videos on tapes',
  ),
  ParentQuestion(
    question: 'How many continents are there on Earth?',
    options: ['4', '6', '7', '8'],
    answer: '7',
  ),  ParentQuestion(
    question: 'Who wrote "Romeo and Juliet"?',
    options: ['Charles Dickens', 'William Shakespeare', 'Jane Austen', 'Mark Twain'],
    answer: 'William Shakespeare',
  ),
  ParentQuestion(
    question: 'What was the main purpose of a rotary phone?',
    options: ['Sending text messages', 'Playing music', 'Making phone calls', 'Taking photos'],
    answer: 'Making phone calls',
  ),
  ParentQuestion(
    question: 'What is a typewriter?',
    options: ['A musical instrument', 'A computer accessory', 'A writing tool', 'A cooking appliance'],
    answer: 'A writing tool',
  ),
  ParentQuestion(
    question: 'What is a black and white television?',
    options: ['A painting technique', 'A type of photography', 'A vintage TV', 'A color-blindness test'],
    answer: 'A vintage TV',
  ),
  ParentQuestion(
    question: 'What was the main purpose of a pager?',
    options: ['Sending emails', 'Tracking fitness', 'Taking photos', 'Receiving short messages'],
    answer: 'Receiving short messages',
  ),];

ParentQuestion getRandomParentGuardQuestion() {
  final Random random = Random();
  final int randomIndex = random.nextInt(parentQuestionBank.length);

  // Retrieve and return the random question
  return parentQuestionBank[randomIndex];
}
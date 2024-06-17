import 'package:quizzler_flutter/question.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question('Flutter is an open source framework created by Google', true),
    Question('Flutter\'s Hot Reload feature resets the apps state', false),
    Question('Flutter apps are written in the programming language Dart', true),
    Question('The building block of Flutter apps is called a \'Widget\'', true),
    Question('Flutter was first unveiled at the Dart developer summit in 2003', false)
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionLabel() {
    return _questionBank[_questionNumber].label;
  }

  bool getAnswer() {
    return _questionBank[_questionNumber].answer;
  }

  bool isFinished() {
    return _questionNumber >= _questionBank.length - 1;
  }

  void reset() {
    _questionNumber = 0;
  }
}
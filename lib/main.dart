import 'package:flutter/material.dart';
import 'package:quizzler_flutter/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Icon> scores = [];
  QuizBrain brain = QuizBrain();
  int questionNumber = 0;
  int questionsAsked = 1;
  int correctAnswers = 0;

  void checkAnswer(bool answer) {
    setState(() {
      if (answer == brain.getAnswer()) {
        scores.add(const Icon(Icons.check, color: Colors.green,));
        correctAnswers++;
      } else {
        scores.add(const Icon(Icons.close, color: Colors.red,));
      }

      if (brain.isFinished()) {
        finishQuiz();
      } else {
        questionsAsked++;
        brain.nextQuestion();
      }
    });
  }

  void finishQuiz() {
    Alert(
      context: context,
      title: 'Finished!',
      desc: 'Congratulations, you have completed the quiz.  You answered $correctAnswers out of $questionsAsked questions correctly.'
    ).show();

    brain.reset();
    scores = [];
    questionsAsked = 1;
    correctAnswers = 0;
  }

  Widget buildButton(String label, Color color, bool value) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: TextButton(
            style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: color,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)
                )
            ),
            onPressed: () {
              checkAnswer(value);
            },
            child: Center(
                child: Text(
                  label,
                  style: const TextStyle(
                      fontSize: 20.0
                  ),
                )
            )
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
            child: Center(
              child: Text(
                brain.getQuestionLabel(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                ),
              ),
            ),
        ),
        buildButton('True', Colors.green, true),
        buildButton('False', Colors.red, false),
        Row(
          children: scores,
        )
      ],
    );
  }
}


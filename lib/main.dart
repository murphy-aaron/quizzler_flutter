import 'package:flutter/material.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        body: SafeArea(
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

  Widget buildButton(String label, Color color) {
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

            },
            child: Center(
                child: Text(
                  label,
                  style: TextStyle(
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
                'Question text goes here.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0
                ),
              ),
            ),
        ),
        buildButton('True', Colors.green),
        buildButton('False', Colors.red),
        Row(
          children: [
            Text('Score coming soon...')
          ],
        )
      ],
    );
  }
}


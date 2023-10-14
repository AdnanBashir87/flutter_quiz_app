import 'package:flutter/material.dart';

class QuizModel extends StatefulWidget {
  const QuizModel({super.key});

  @override
  State<QuizModel> createState() => _QuizModelState();
}

class _QuizModelState extends State<QuizModel> {
  List<Widget> scoreKeeper = [];
  List<String> questions = [
    'You can lead a cow down stairs but not up stairs?',
    'Approximately one quarter of human bones are in the feet?',
    'A slug\'s blood is green?',
  ];
  List<bool> answers = [false, true, true];
  int questionNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[questionNumber],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                color: Colors.green,
                child: const Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
              onPressed: () {
                bool correctAns = answers[questionNumber];
                if (correctAns == true) {
                  setState(() {
                    scoreKeeper.add(
                      const Icon(Icons.check, color: Colors.green),
                    );
                    questionNumber++;
                  });
                } else {
                  setState(() {
                    scoreKeeper.add(
                      const Icon(Icons.close, color: Colors.red),
                    );
                    questionNumber++;
                  });
                }
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                color: Colors.red,
                child: const Text(
                  'False',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
              onPressed: () {
                bool correctAns = answers[questionNumber];
                if (correctAns == false) {
                  setState(() {
                    scoreKeeper.add(
                      const Icon(Icons.check, color: Colors.green),
                    );
                    questionNumber++;
                  });
                } else {
                  setState(() {
                    scoreKeeper.add(
                      const Icon(Icons.close, color: Colors.red),
                    );
                    questionNumber++;
                  });
                }
              },
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: scoreKeeper,
          ),
        )
      ],
    );
  }
}

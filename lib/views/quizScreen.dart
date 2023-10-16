import 'package:flutter/material.dart';
import '../model/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizModel extends StatefulWidget {
  const QuizModel({super.key});

  @override
  State<QuizModel> createState() => _QuizModelState();
}

class _QuizModelState extends State<QuizModel> {
  List<Icon> scoreKeeper = [];
  QuizBrain quizBrain = QuizBrain();

  // for checking answers wither it is correct or not
  void checkAnswer(bool userPickedAns) {
    bool correctAns = quizBrain.getQuestionAnswer();
    setState(() {
      if (quizBrain.isQuizFinished() == true) {
        Alert(
          context: context,
          title: "Quiz Finished",
          desc: "You have reached at the end of the quiz!",
        ).show();

        quizBrain.resetQuestionNumber();

        scoreKeeper = [];
      } else {
        if (userPickedAns == correctAns) {
          scoreKeeper.add(
            const Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
          quizBrain.nextQuestion();
        } else {
          scoreKeeper.add(
            const Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
          quizBrain.nextQuestion();
        }
      }
    });
  }

  // ///////////////////////////////////////////////
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
                quizBrain.getQuestionText(),
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
                checkAnswer(true);
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
                checkAnswer(false);
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

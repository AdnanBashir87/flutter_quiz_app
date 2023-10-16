import 'package:quizzler/model/question.dart';

class QuizBrain {
  int _questionNumber = 0;

  final List<Question> _questionBook = [
    Question(
        question: 'You can lead a cow down stairs but not up stairs?',
        answer: false),
    Question(question: 'A slug\'s blood is green?', answer: true),
    Question(
        question: 'Approximately one quarter of human bones are in the feet?',
        answer: true),
  ];

  String getQuestionText() {
    return _questionBook[_questionNumber].question;
  }

  bool getQuestionAnswer() {
    return _questionBook[_questionNumber].answer;
  }

  void nextQuestion() {
    if (_questionNumber < _questionBook.length - 1) {
      _questionNumber++;
    }
  }

  bool isQuizFinished() {
    if (_questionNumber >= _questionBook.length - 1) {
      print('Returning a statement true');
      return true;
    } else {
      return false;
    }
  }

  void resetQuestionNumber() {
    _questionNumber = 0;
  }
}

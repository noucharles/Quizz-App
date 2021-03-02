import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function resetQuiz;

  Result({this.totalScore, this.resetQuiz});

  String get resultPhrase {
    var resultText;
    if (totalScore <= 8) {
      resultText = "Excellent, ton score est de $totalScore";
    } else if (totalScore <= 12) {
      resultText = "Très bon score, ton score est de $totalScore";
    } else if (totalScore <= 16) {
      resultText = "Tu peux mieux faire, ton score est de $totalScore";
    } else {
      resultText = "Tu as un mauvais score ($totalScore)";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        FlatButton(
          onPressed: resetQuiz,
          child: Text('Recommencer le Quizz !'),
          textColor: Colors.blue,
        )
      ],
    );
  }
}

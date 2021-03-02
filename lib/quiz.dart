import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/question.dart';

import 'answer.dart';

class Quiz extends StatelessWidget {
  final Function answerQuestions;
  final int questionIndex;
  final List<Map<String, Object>> questions;

  Quiz(
      {@required this.answerQuestions,
      @required this.questions,
      @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Question(questions[questionIndex]['questionText']),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestions(answer['score']), answer['text']);
        }).toList(),
      ],
    ));
  }
}

import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_complete_guide/quiz.dart';
import 'package:flutter_complete_guide/result.dart';

void main() {
  //runApp est une methode de l'equipe flutter.Elle prends en parametre notre wi
  //dget principal
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  static const _questions = [
    {
      'questionText': "Quelle est ta couleur favorite ?",
      'answers': [
        {'text': 'Noir', 'score': 10},
        {'text': 'Rouge', 'score': 5},
        {'text': 'Vert', 'score': 3},
        {'text': 'Blanc', 'score': 1}
      ],
    },
    {
      'questionText': "Quel est ton animal favoris?",
      'answers': [
        {'text': 'Lapin', 'score': 3},
        {'text': 'Serpent', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ],
    },
    {
      'questionText': "Quel est ton perso shonen favoris?",
      'answers': [
        {'text': 'Sasuke', 'score': 1},
        {'text': 'Ichigo', 'score': 1},
        {'text': 'Gon', 'score': 1},
        {'text': 'Eren', 'score': 1},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      //setState pour recharger le build, reconstruire la page.
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestions(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print("Nous avons des questions");
    } else {
      print("No more questions");
    }
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "QUIZZ APP",
          ),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestions: _answerQuestions,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(
                totalScore: _totalScore,
                resetQuiz: _resetQuiz,
              ),
      ),
    );
    //Material App est un widget de l'ekip flutter pour transformer notre combin
    //aison de widget dans une vraie app
  }
}

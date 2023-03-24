import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Where do I live?',
      'answers': [
        {'text': 'Australia', 'score': 0},
        {'text': 'Colombia', 'score': 0},
        {'text': 'Brazil', 'score': 1},
        {'text': 'Deutschland', 'score': 0},
      ],
    },
    {
      'questionText': 'How old I am?',
      'answers': [
        {'text': 'Middle 30\'s', 'score': 0},
        {'text': '29', 'score': 0},
        {'text': '40', 'score': 1},
        {'text': '45', 'score': 0},
      ],
    },
    {
      'questionText': 'What\'s my favorite stack?',
      'answers': [
        {'text': 'Flutter', 'score': 1},
        {'text': 'Typescript', 'score': 1},
        {'text': 'Java', 'score': 0},
        {'text': 'React', 'score': 1},
      ],
    },
    {
      'questionText': 'Which one is my e-mail address?',
      'answers': [
        {'text': 'rodrigosakae@hotmail.com', 'score': 0},
        {'text': 'devsakae@gmail.com', 'score': 1},
        {'text': 'developerrsakae@gmail.com', 'score': 0},
        {'text': 'rodsakae@gmail.com', 'score': 1},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() => _questionIndex += 1);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('About me'),
        ),
        body: (_questionIndex < _questions.length)
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}

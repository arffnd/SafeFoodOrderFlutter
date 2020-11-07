import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Enter table number',
      'answers': [
        {'text': '1', 'score': 1},
        {'text': '2', 'score': 2},
        {'text': '3', 'score': 3},
        {'text': '4', 'score': 4},
      ],
    },
    {
      'questionText': 'Choose your starter',
      'answers': [
        {'text': 'Panner Tikka', 'score': 1},
        {'text': 'Chiken Wings', 'score': 2},
        {'text': 'Fish Fry', 'score': 3},
        {'text': 'None', 'score': 0},
      ],
    },
    {
      'questionText': 'Choose your rice',
      'answers': [
        {'text': 'Basonti polau', 'score': 1},
        {'text': 'Mixed fried rice', 'score': 2},
        {'text': 'Normal rice', 'score': 3},
        {'text': 'None', 'score': 0},
      ],
    },
    {
      'questionText': 'Choose what u like',
      'answers': [
        {'text': 'Shukto', 'score': 1},
        {'text': 'mixed dal', 'score': 2},
        {'text': 'Alu posto', 'score': 3},
        {'text': 'None', 'score': 0},
      ],
    },
    {
      'questionText': 'Choose for main course',
      'answers': [
        {'text': 'Chiken Kosha', 'score': 1},
        {'text': 'Mutton Kosha', 'score': 2},
        {'text': 'Chanar Dalna', 'score': 3},
        {'text': 'None', 'score': 0},
      ],
    },
    {
      'questionText': 'Choose your desert',
      'answers': [
        {
          'text': 'Rosogolla',
          'score': 1,
        },
        {'text': 'Golapjam', 'score': 2},
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
    _totalScore = 10 * _totalScore + score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Safe Order'),
          backgroundColor: Color(0xFF00E676),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: _questionIndex < _questions.length
              ? Quiz(
            answerQuestion: _answerQuestion,
            questionIndex: _questionIndex,
            questions: _questions,
          ) //Quiz
              : Result(_totalScore, _resetQuiz),
        ), //Padding
      ), //Scaffold
      debugShowCheckedModeBanner: false,
    ); //MaterialApp
  }
}

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
      'questionText': '1. Какие числа используют при счете?',
      'answers': [
        {'text': 'Природные', 'score': -2},
        {'text': 'Естественные ', 'score': -2},
        {'text': 'Натуральные', 'score': 10},
        {'text': 'Порядковые', 'score': -2},
      ],
    },
    {
      'questionText': '2. Какими бывают фотоаппараты?',
      'answers': [
        {'text': 'Рациональные', 'score': -2},
        {'text': '.Дробные', 'score': -2},
        {'text': 'Числовые', 'score': -2},
        {'text': 'Цифровые', 'score': 10},
      ],
    },
    {
      'questionText': ' 3.  Что выкидывает человек, совершая какой- нибуть странный,смешной поступок?',
      'answers': [
        {'text': 'Цифру', 'score': -2},
        {'text': 'Номер', 'score': 10},
        {'text': ' Число', 'score': -2},
        {'text': 'Монету', 'score': -2},
      ],
    },
    {
      'questionText': ' 4. Какое математическое действие с клетками обеспечивает рост органов живого организм?',
      'answers': [
        {'text': 'Сложение ', 'score': -2},
        {'text': 'Умножение', 'score': -2},
        {'text': 'Вычитание', 'score': -2},
        {'text': 'Деление', 'score': 10},
      ],
    },
    {
      'questionText':
      '5. Что получается при делении чисел?',
      'answers': [
        {'text': 'Личное ', 'score': -2},
        {'text': 'Частное', 'score': 10},
        {'text': 'Общественное', 'score': -2},
        {'text': 'Обида', 'score': -2},

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
          title: Text('QuizL'),
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

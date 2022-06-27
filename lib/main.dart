// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './quiz.dart';
import './results.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionLabel': 'Primeira pergunta:\nQual sua parte favorita do dia?',
      'answers': [
        {'text': 'Manhã', 'score': 0},
        {'text': 'Tarde', 'score': 3},
        {'text': 'Noite', 'score': 10},
        {'text': 'Madrugada', 'score': 6}
      ]
    },
    {
      'questionLabel': 'Segunda pergunta:\nQual sua cor favorita?',
      'answers': [
        {'text': 'Branco', 'score': 0},
        {'text': 'Azul', 'score': 6},
        {'text': 'Vermelho', 'score': 3},
        {'text': 'Preto', 'score': 10}
      ]
    },
    {
      'questionLabel': 'Terceira pergunta:\nQue tipo de música você ouve?',
      'answers': [
        {'text': 'RicardoSynth', 'score': 10},
        {'text': 'Rock', 'score': 6},
        {'text': 'Sertanejo', 'score': 0},
        {'text': 'Forró', 'score': 3}
      ]
    },
    {
      'questionLabel': 'Quarta pergunta:\nQual a melhor área de T.I.?',
      'answers': [
        {'text': 'Análise', 'score': 10},
        {'text': 'Programação', 'score': 6},
        {'text': 'Banco de Dados', 'score': 0},
        {'text': 'Redes', 'score': 3}
      ]
    },
    {
      'questionLabel': '\nQuinta pergunta:\nQuem é o melhor professor?',
      'answers': [
        {'text': 'Ricardo', 'score': 0},
        {'text': 'Ricardo', 'score': 0},
        {'text': 'Ricardo', 'score': 0},
        {'text': 'Ricardo', 'score': 0},
      ]
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      print('resetado'); // checker
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex++;
    });
    print(_questionIndex); // checker
    if (_questionIndex < _questions.length) {
      print('tem mais'); // checker
    } else {
      print('acabou!'); // checker
    }
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Teste de personalidade')),
          elevation: 5.0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 6, 255, 35),
                    Color.fromARGB(255, 255, 177, 50),
                  ],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                _answerQuestion,
                _questionIndex,
                _questions,
              )
            : Results(_totalScore, _resetQuiz),
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(255, 217, 211, 255),
      ),
    );
  }
}

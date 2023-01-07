import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import './quize.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First App',
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headline1: GoogleFonts.lato(
            color: Colors.green,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        errorColor: Colors.red,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _questionIndex = 0;
  int _totalMark = 0;

  List<Map<String, Object>> _questions = [
    {
      'question': 'What is your Country Name ?',
      'answers': [
        {'text': 'USA', 'score': 10},
        {'text': 'UK', 'score': 8},
        {'text': 'Tibbot', 'score': 7},
        {'text': 'Nepal', 'score': 5}
      ],
    },
    {
      'question': 'What about Flutter ?',
      'answers': [
        {'text': 'Language', 'score': 7},
        {'text': 'Framework', 'score': 10},
        {'text': 'Application', 'score': 0},
      ],
    },
    {
      'question': 'What about Python ?',
      'answers': [
        {'text': 'Programming Language', 'score': 10},
        {'text': 'Nothing', 'score': -10}
      ],
    },
  ];
  final List<int> allMarks = [];

  void changeQuestion(int score) {
    _totalMark += score;
    allMarks.add(score);

    if (_questions.length > _questionIndex) {
      setState(() {
        _questionIndex += 1;
      });
    }
  }

  void backPrevious() {
    _questionIndex -= 1;
    setState(() {
      _totalMark -= allMarks.elementAt(_questionIndex);
    });
    allMarks.removeAt(_questionIndex);
  }

  void resetQuestion() {
    setState(() {
      _totalMark = 0;
      _questionIndex = 0;
    });
    allMarks.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _questions.length > _questionIndex
            ? Quize(
                changeQuestionHandler: changeQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
                backPrevious: backPrevious,
              )
            : Result(
                totalMark: _totalMark,
                resetQuestion: resetQuestion,
              ),
      ),
    );
  }
}

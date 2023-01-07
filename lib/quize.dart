import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';
import './back_to_previous.dart';

class Quize extends StatelessWidget {
  final Function changeQuestionHandler;
  final int questionIndex;
  final List<Map<String, Object>> questions;
  final VoidCallback backPrevious;
  const Quize({
    super.key,
    required this.changeQuestionHandler,
    required this.questions,
    required this.questionIndex,
    required this.backPrevious,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          question: questions[questionIndex]['question'] as String,
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
            onPressedHandler: () => changeQuestionHandler(answer['score']),
            answer: answer['text'] as String,
          );
        }).toList(),
        questionIndex > 0
            ? BackToPrevious(
                backPrevious: backPrevious,
              )
            : SizedBox(
                height: 1,
              ),
      ],
    );
  }
}

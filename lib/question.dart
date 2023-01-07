import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String question;
  const Question({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      width: double.infinity,
      child: Text(
        question,
        style: Theme.of(context).textTheme.headline1,
        textAlign: TextAlign.center,
      ),
    );
  }
}

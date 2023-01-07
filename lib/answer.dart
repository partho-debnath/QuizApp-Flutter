import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback onPressedHandler;
  final String answer;
  const Answer(
      {super.key, required this.onPressedHandler, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          // backgroundColor: Colors.blueGrey,
          elevation: 10,
          foregroundColor: Colors.amber,
        ),
        child: Text(
          answer,
          style: Theme.of(context).textTheme.headline2!.copyWith(
                fontSize: 20,
              ),
        ),
        onPressed: onPressedHandler,
      ),
    );
  }
}

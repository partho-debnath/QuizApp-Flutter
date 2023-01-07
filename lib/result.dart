import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalMark;
  final VoidCallback resetQuestion;
  const Result(
      {super.key, required this.totalMark, required this.resetQuestion});

  int get result {
    return totalMark;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Your Score is $result',
            style: Theme.of(context).textTheme.headline1,
          ),
          ElevatedButton(
            onPressed: resetQuestion,
            child: Text('Reset All'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

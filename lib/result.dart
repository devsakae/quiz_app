import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int finalScore;
  final VoidCallback resetHandler;

  Result(this.finalScore, this.resetHandler);

  String get resultPhrase {
    var resultText = 'Best of bests!';
    if (finalScore <= 1) {
      resultText = 'You need more studying!';
    } else if (finalScore <= 3) {
      resultText = 'Almost! You could do better';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            onPressed: resetHandler,
            child: Text(
              'Restart quiz',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

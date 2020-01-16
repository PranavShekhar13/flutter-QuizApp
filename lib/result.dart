import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;

  final Function resetQuiz;

  Result(this.resultScore, this.resetQuiz); //Taking positional arguments in the constructor

  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'You are Awesome an Innocent !!';
    } else if (resultScore > 8 && resultScore <= 12) {
      resultText = 'You are pretty likeable and positive';
    } else if (resultScore > 12 && resultScore <= 16) {
      resultText = 'You are more into Masculinity and Strength';
    } else {
      resultText = 'You are someone who looks up for manliness only';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(resultPhrase,
              style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold),
              textAlign: TextAlign.center
              ),
              FlatButton(child: Text('Reset Quiz',),onPressed: resetQuiz,textColor: Colors.blue,)
        ],
      ),
    );
  }
}

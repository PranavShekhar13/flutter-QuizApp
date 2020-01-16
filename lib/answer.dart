import 'package:flutter/material.dart';

class Answer extends StatelessWidget {

  final Function selectHandler; // final is runtime constant value(it will not change when it has it's intial value) wheras const is compile time constant value.

  final String answerText;

  Answer(this.selectHandler, this.answerText);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
   
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,   //static- Properties that we can access without instantiating the class which ensures the class is a grouping mechamism for these utility values.
        child: Text(answerText),
        onPressed: selectHandler,
      ),
    );
  }
}
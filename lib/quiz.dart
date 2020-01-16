import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {

final List<Map<String, Object>> questions;

final Function answerQuestion;

final int questionIndex;

Quiz({@required this.answerQuestion, @required this.questions, @required this.questionIndex});
 
 // Taking named arguments in the constructor

  @override
  Widget build(BuildContext context) {
    return Column(
              children: [
                Question(
                  questions[questionIndex]
                      ['questionText'], //Map is inside the questions list.
                ),
                ...(questions[questionIndex]['answers'] as List<Map<String, Object>>).map((answer) {
                  //... -Spread Operator - Takes a list and pulls all the values out of it and add them to the surrounding list as individual values - so that we don't add a list to a list( because children is itself a list and map func is also returning a list) but values of a list to a list.
                  //The map method executes a function that we have to pass as an argument to the map on every element on the list
                  // The map method takes an anonymous function as an argument- which(the anonymous function) automatically takes the current element as an argument
                  //( as List<String>)  - To inform Dart that the 'answers' key in the map is a List full of Strings)
                  return Answer(() => answerQuestion(answer['score']), answer['text']);
                }).toList() // .toList() - converts the values map gives to us(iterables) to a List
              ],
            );
  }
}
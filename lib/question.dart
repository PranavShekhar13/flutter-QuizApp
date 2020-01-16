//Customized Widget - Replacing Text Widget in main.dart

import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String
      questionText; //final keyword secures that the value of questionText won't change throughout this class- which would have given an unmuted class error otherwise(without using final)

  Question(
      this.questionText); // Passing data externally to stateless widget(through constructor of the class) which rerenders the app UI

  @override
  Widget build(BuildContext context) {
    return Container( 
      margin: EdgeInsets.all(10), //EdgeInsets.all() -It is a special constructor which allows us to create objects of EdgeInsets class(ctrl+ hover) in different variants
      width: double.infinity, //double.infinity sets the full width of the container according to the screen resolution of the device
      child: Text( //Container takes a child named argument which is our Text() widget here.
        questionText,
        style: TextStyle(
            fontSize:28), //style: and textAlign: are named arguments for Text() widget provided by material.dart
        textAlign: TextAlign.center, //TextStyle() is again an instance of a class provided by material.dart which in turn takes named arguments- fontSize:
      ),
    );
  } //TextAlign.center is an enum - list of predefined values encoded as numbers - data type in dart which simply assigns labels to these different options
}

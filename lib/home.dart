/*The basic difference between a stateless widget and
 a stateful widget is that in a stateless widget we can add data externally
 through the constructor of the defined class(widget) which can be used by the build method to
  (re)render the app UI.
   
 But in a stateful widget we have an internal state of the widget in addition to the external data
we are providing through the constructor of the defined class, so in this case the build method can use both
the internal state(of the widget) and the external data to (re)render the app UI


Stateless widgets can't be rebuild when it's properties change - Whilst we can add (and also change) properties in a StatelessWidget, 
there's no way of telling Flutter that it should re-run build() upon such changes. */

import 'package:flutter/material.dart';
import './result.dart';
import './quiz.dart';

class Home extends StatefulWidget {
  // 1st class- A StatefulWidget is a combination of two classes
  @override
  State<StatefulWidget> createState() {
    return _HomeState(); //createState() method has to return(return type- State) a state object( HomeState() ) which is connected to a stateful widget(<StatefulWidget>)
  }
} // This Widget can be rebuild

class _HomeState extends State<Home> {
  // State<Home> - Pointer to our Home class( our StatefulWidget)-  Referring that the our state class(HomeState)  belongs to widget class(Home)     //2nd class- HomeState  //State- again a class from material.dart- It is a generic class.
/* Why two classe in a StatefulWidget?

The Widget(class- here Home) can be recreated when the external data changes.
Wheras the State is persistent. It(State Class- HomeState) is atttatched to the widget(<Home>) but unlike the widget class(Home) it cannot
be recreated which is important for storing our state.

When the questionIndex inside the class derived from the State -(HomeState()) changes and the external data
 inside the widget class(Home) changes, only the widget class(Home()) data is rebuild and the data inside the
 State class(HomeState()) remains as it is. 

*/

  static const _questions = [
    //const - Compile time constant value(it also implicitally means runtime constant) - We know the values of the list will never change(Both the variable and the list is protected against changes)
    {
      'questionText': 'What is your favoirite animal?',
      'answers': [
        {'text':'Zebra', 'score':3},
        {'text':'Lion', 'score':10},
        {'text':'Elephant', 'score':7},
        {'text':'Giraffe', 'score':6},
      ], //Creating a Map using {} - A map is a collection of key value pairs. A value can be anything be it a list or a map or string.
    },
    {
      'questionText': 'What is your favoirite cuisine?',
      'answers': [
        {'text':'Thai', 'score':5},
        {'text':'Chinese', 'score':8},
        {'text':'Japanese', 'score':4},
        {'text':'Indian', 'score':10},
      ],
    },
    {
      'questionText': 'What is your favoirite sport?',
      'answers': [
        {'text':'Football', 'score':10},
        {'text':'Cricket', 'score':8},
        {'text':'Hockey', 'score':6},
        {'text':'Golf', 'score':4},
      ],
    },
  ];
  

  var _questionIndex = 0;
  var _totalScore = 0;

  void _restartQuiz(){
    setState(() {     // So that our Widget Tree in main.dart is rebuild by calling the build function again which in turn calls the Quiz() widget again- (as _questionIndex < _questions.length(true) again) 
      _questionIndex = 0;   
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {

    _totalScore = _totalScore + score;


    setState(() {
      
      _questionIndex = _questionIndex + 1;
    }); //setState() is a method of State class(which we our inheriting) in material.dart - It takes an anonymous function- In that function we put our data we want to change and to be reflected in our UI
    // If we don't use setState( () { })method our change in data won't affect the UI because the flutter framework doesn't allows any click to chnage the data on the UI without mentioning (in setState() method) which is good for our application's performance. So that when state changes the widget is rerenderd(by the build() method).

    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print("We have more questions...");
    } else {
      print("No more questions");
    }
  }

  @override
  Widget build(BuildContext context) {


/*var dummy = const['Pranav'];
dummy.add('Shekhar');   // Compile Time Error- Cannot add to an unmodifiable List. ( If We don't(never) want to change our list object)

dummy =[];  // We can reuse our variable and assign a new value to it(Overiding the previous value) if it's value is const type. 
*/

    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Quiz App'), // Text is a widget(class) provided by material.dart- Takes a string as an input
      ),
      body: _questionIndex < _questions.length
          ? Quiz(answerQuestion: _answerQuestion, questions: _questions, questionIndex: _questionIndex)
          
          : Result(_totalScore, _restartQuiz),
    );
  }
}

import 'package:quiz_app/home.dart';

import 'package:flutter/material.dart';

class App extends StatelessWidget {
    //StatelessWidget is a base class of material.dart file which allows us to create our own widgets.

/*Extending a stateless widget makes our class app a widget that can be used as a widget in flutter- As definining our class without
extending would have given a blank screen- extending from a predefined base class makes our class a widget as every pixel on the screen is controlled by FLutter*/
  @override
  Widget build(BuildContext context) {
        //build is a method of the class StatelessWidget- returns the widgets(widget tree) which should be rendered onto the screen(renders the UI)
    //context(argument for build method- holds meta info about the app) is a special type of object which will be passed into the build method automatically
    //buildContext(class in material.dart) is a special object return type - the context object is of the BuildContext type.
    // Widget(class in material.dart) build() method needs to return a widget
    
    return MaterialApp(        //returning MaterialApp(widget- class-material.dart) inside of App class-
        //MaterialApp widget does the base setup for our combination of widgets to be rendered as an App. It is a class but we can pass data to it through constructors.
      home: Home(),
      //Material app uses named arguments(too many) - home: home is basically the core widget that flutter will bring on to the screen when the entire app is mounted
    );
  }
}

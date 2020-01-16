import 'package:quiz_app/app.dart';
import 'package:flutter/material.dart';//Fetching Predefined class(library)- Material(consists of several built in widgets) from the Flutter Framework(package) through the depandancy defined in pubspec.yaml

main() {//main()- Automatically executed by Flutter when the app starts (First to be pushed)
  runApp( //runApp()- material.dart file function - runs our application - takes our widget tree and draws something on the screen based on that tree - calls the build method
    App(), // App() (Paranthesis is necessary because we create an instance of a class by using Paranthesis) It is our core widget(class) and  is passed into runApp() - runApp() in turn calls the build method for us
  );
}

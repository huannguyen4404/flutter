import 'package:flutter/material.dart';

void main() {
  //Center is a widget, Text is a widget
  runApp(
    MyWidget(name: 'Henry', age: 18),
  );
}

//You can define your own Widget
class MyWidget extends StatelessWidget {
  //Let's define a constructor here
  String name;
  int age;

  MyWidget({this.name, this.age});

  //StatelessWidget: widget which do not have "state"(property which has been changed <-> User Interface)
  @override
  Widget build(BuildContext context) {
    // build: abstract method from parent class(StatelessWidget)
    return MaterialApp(
        title: "This is my first app",
        home: Scaffold(
          body: Center(
            child: Text(
              'MyWidget, name: $name - age: $age',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
              textDirection: TextDirection.ltr, //left-to-right
            ),
          ),
        ));
  }
}

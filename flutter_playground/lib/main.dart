import 'package:flutter/material.dart';
import 'my_widget.dart';

void main() {
  //Center is a widget, Text is a widget
  runApp(
    MyWidget(name: 'Henry', age: 30),
  );
}

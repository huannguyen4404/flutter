import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    primarySwatch: Colors.cyan,
    fontFamily: 'Itim',
    textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(color: Color.fromRGBO(20, 52, 52, 1)),
          bodyText2: TextStyle(color: Color.fromRGBO(20, 52, 52, 1)),
          headline6: TextStyle(
            fontSize: 28,
            color: Colors.white,
            fontFamily: 'Sunshiney',
          ),
        ),
  );
}

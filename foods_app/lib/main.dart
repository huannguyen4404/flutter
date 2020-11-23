import 'package:flutter/material.dart';
import 'package:foods_app/theme.dart';
import 'package:foods_app/routes.dart';
import 'package:foods_app/screens/category/category_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App with Navigation',
      initialRoute: '/',
      routes: routes,
      theme: appTheme(),
      home: Scaffold(
        appBar: AppBar(
          // centerTitle: false,
          title: const Text('Food\'s categories'),
        ),
        body: SafeArea(
          child: CategoryScreen(),
        ),
      ),
    );
  }
}

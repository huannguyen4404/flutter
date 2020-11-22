import 'package:flutter/material.dart';
import 'package:foods_app/models/category.dart';

class FoodsScreen extends StatelessWidget {
  final Category category;

  FoodsScreen({this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${category.name}'),
      ),
      body: Center(
        child: Text(
          'This show Foods\'s list',
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}

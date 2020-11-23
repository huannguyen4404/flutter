import 'package:flutter/material.dart';
import 'package:foods_app/models/category.dart';

class FoodsScreen extends StatelessWidget {
  static const String routeName = '/FoodsScreen';
  Category category;

  FoodsScreen({this.category});

  @override
  Widget build(BuildContext context) {
    Map<String, Category> arguments = ModalRoute.of(context).settings.arguments;
    this.category = arguments['category'];

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

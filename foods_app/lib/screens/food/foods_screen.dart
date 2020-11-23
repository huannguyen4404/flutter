import 'package:flutter/material.dart';
import 'package:foods_app/models/category.dart';
import 'package:foods_app/models/food.dart';

import 'package:foods_app/screens/food/widgets/food_item.dart';

import 'package:foods_app/dummy_data.dart' as data;

class FoodsScreen extends StatelessWidget {
  static const String routeName = '/FoodsScreen';
  Category category;

  FoodsScreen({this.category});

  @override
  Widget build(BuildContext context) {
    Map<String, Category> arguments = ModalRoute.of(context).settings.arguments;
    this.category = arguments['category'];

    List<Food> foods = data.FAKE_FOODS
        .where((food) => food.categoryId == this.category.id)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('${category.name}'),
      ),
      body: SafeArea(
        child: Center(
          child: foods.length > 0
              ? ListView.builder(
                  itemCount: foods.length,
                  itemBuilder: (BuildContext context, int idx) =>
                      FoodItem(food: foods[idx]),
                )
              : Text(
                  'This menu is not available now.',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
        ),
      ),
    );
  }
}

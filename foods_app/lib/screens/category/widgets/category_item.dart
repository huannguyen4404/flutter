import 'package:flutter/material.dart';

import 'package:foods_app/models/category.dart';
import 'package:foods_app/screens/food/foods_screen.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  CategoryItem({this.category});

  @override
  Widget build(BuildContext context) {
    Color _color = this.category.color;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, FoodsScreen.routeName, arguments: {
          'category': category,
        });
      },
      splashColor: Colors.deepPurple,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(category.name, style: Theme.of(context).textTheme.headline6),
          ],
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [_color.withOpacity(0.7), _color],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft),
          color: _color,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

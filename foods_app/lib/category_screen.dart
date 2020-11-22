import 'package:flutter/material.dart';

import 'package:foods_app/data.dart';
import 'package:foods_app/category_item.dart';
import 'package:foods_app/data.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(12),
      children: FAKE_CATEGORIES
          .map((eachCategory) => CategoryItem(category: eachCategory))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
        childAspectRatio: 3 / 2, //width / height
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
    );
  }
}

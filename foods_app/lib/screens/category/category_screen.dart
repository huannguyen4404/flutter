import 'package:flutter/material.dart';

import 'package:foods_app/screens/category/widgets/category_item.dart';
import 'package:foods_app/dummy_data.dart' as data;

class CategoryScreen extends StatelessWidget {
  static const String routeName = '/CategoryScreen';

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(12),
      children: data.FAKE_CATEGORIES
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

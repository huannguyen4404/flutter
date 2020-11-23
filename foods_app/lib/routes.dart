import 'package:flutter/widgets.dart';
import 'package:foods_app/screens/category/category_screen.dart';
import 'package:foods_app/screens/food/foods_screen.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  '/CategoryScreen': (BuildContext context) => CategoryScreen(),
  '/FoodsScreen': (BuildContext context) => FoodsScreen(),
};

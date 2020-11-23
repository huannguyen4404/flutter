import 'package:flutter/widgets.dart';
import 'package:foods_app/category_screen.dart';
import 'package:foods_app/foods_screen.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  '/CategoryScreen': (BuildContext context) => CategoryScreen(),
  '/FoodsScreen': (BuildContext context) => FoodsScreen(),
};

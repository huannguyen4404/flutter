import 'dart:math';

import 'package:flutter/cupertino.dart';

class Food {
  int id;
  String name;
  String imgUrl;
  Duration duration; // time to cook
  Complexity complexity;
  List<String> ingredients = List<String>();
  int categoryId;

  Food({
    @required this.name,
    @required this.imgUrl,
    @required this.duration,
    this.complexity,
    this.ingredients,
    this.categoryId,
  }) {
    this.id = Random().nextInt(1000);
  }
}

enum Complexity { Simple, Medium, Hard }

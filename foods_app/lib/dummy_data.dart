import 'package:flutter/material.dart';
import 'package:foods_app/models/food.dart';
import 'models/category.dart';

const FAKE_CATEGORIES = const [
  Category(id: 1, name: 'Japanese\'s Foods', color: Colors.deepOrange),
  Category(id: 2, name: 'Pizza', color: Colors.teal),
  Category(id: 3, name: 'Humburgers', color: Colors.pink),
  Category(id: 4, name: 'Italian', color: Colors.blueAccent),
  Category(id: 5, name: 'Milk & Yoghurt', color: Colors.deepPurple),
  Category(id: 6, name: 'Vegetables', color: Colors.green),
  Category(id: 7, name: 'Fruits', color: Colors.redAccent),
];

var FAKE_FOODS = [
  Food(
      name: "sushi - 寿司",
      imgUrl: "https://upload.wikimedia.org/wikipedia/commons/c/cf/Salmon_Sushi.jpg",
      duration: Duration(minutes:25),
      complexity: Complexity.Medium,
      ingredients: ['Sushi-meshi', 'Nori', 'Condiments'],
      categoryId: 1),
  Food(
      name: "Pizza tonda",
      imgUrl: "https://www.angelopo.com/filestore/images/pizza-tonda.jpg",
      duration: Duration(minutes:15),
      complexity: Complexity.Hard,
      ingredients: ['Tomato sauce','Fontina cheese','Pepperoni','Onions','Mushrooms','pepperoncini'],
      categoryId: 2),
  Food(
      name: "Makizushi",
      imgUrl: "https://upload.wikimedia.org/wikipedia/commons/0/0b/KansaiSushi.jpg",
      complexity: Complexity.Simple,
      duration: Duration(minutes:20),
      categoryId: 1),
  Food(
      name: "Tempura",
      imgUrl: "https://upload.wikimedia.org/wikipedia/commons/a/ac/Peixinhos_da_horta.jpg",
      duration: Duration(minutes: 15),
      complexity: Complexity.Simple,
      categoryId: 1),
  Food(
      name: "Neapolitan pizza",
      imgUrl: "https://img-global.cpcdn.com/recipes/7f1a5380090f6300/1280x1280sq70/photo.jpg",
      duration: Duration(minutes:20),
      complexity: Complexity.Medium,
      ingredients: ['Fontina cheese','Tomato sauce','Onions','Mushrooms'],
      categoryId: 2),
  Food(
      name: "Sashimi",
      imgUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Sashimi_-_Tokyo_-_Japan.jpg/2880px-Sashimi_-_Tokyo_-_Japan.jpg",
      duration: Duration(hours: 1, minutes: 5),
      complexity: Complexity.Medium,
      categoryId: 1),
  Food(
      name: "Homemade Humburger",
      imgUrl: "https://upload.wikimedia.org/wikipedia/commons/5/58/Homemade_hamburger.jpg",
      duration: Duration(minutes: 20),
      complexity: Complexity.Hard,
      categoryId: 3),
];
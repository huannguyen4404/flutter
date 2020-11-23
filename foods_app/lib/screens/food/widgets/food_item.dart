import 'package:flutter/material.dart';
import 'package:foods_app/models/food.dart';
import 'package:foods_app/screens/food/detail_screen.dart';

class FoodItem extends StatelessWidget {
  final Food food;

  FoodItem({this.food});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => FoodsDetailScreen(food: food),
        ));
      },
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              clipBehavior: Clip.hardEdge,
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/loading.gif',
                image: food.imgUrl,
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 30,
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white, width: 2)),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.timer,
                    color: Colors.white,
                    size: 25,
                  ),
                  Text(
                    '${food.duration.inMinutes} min',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 30,
            right: 30,
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: <Widget>[
                  Text(
                    '${food.complexity.toString().split('.').last}',
                    style: TextStyle(fontSize: 22, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 30,
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '${food.name}',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:foods_app/models/food.dart';

class FoodsDetailScreen extends StatelessWidget {
  final Food food;

  FoodsDetailScreen({this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${food.name}'),
      ),
      body: Column(
        children: [
          Center(
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/images/loading.gif',
              image: food.imgUrl,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Ingredients',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: food.ingredients.length,
              itemBuilder: (ctx, idx) {
                String ingredient = this.food.ingredients[idx];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      '${idx + 1}',
                      style: TextStyle(color: Colors.white, fontSize: 19),
                    ),
                  ),
                  title: Text(ingredient, style: TextStyle(fontSize: 22)),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

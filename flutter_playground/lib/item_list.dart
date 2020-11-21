import 'package:flutter/material.dart';

import 'item.dart';

class ItemList extends StatelessWidget {
  final List<Item> items;

  ItemList({this.items});

  @override
  Widget build(BuildContext context) {
    // "Scrollable" with let use ListView:
    // 1.ListView(children: <Widget>[]) => this loads all children at the same time
    // 2.ListView(itemBuilder: ...) => this loads only visible items
    return Container(
      height: 500,
      child: _buildListView(),
    );
  }

  ListView _buildListView() {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (ctx, idx) {
        return Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: idx % 2 == 0 ? Colors.blueGrey : Colors.blue,
          elevation: 10,
          child: ListTile(
            leading: const Icon(Icons.check),
            title: Text(
              items[idx].content,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              'Cost: ${items[idx].money}\$',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            onTap: () {
              print('Tapped on: ${items[idx].content}');
            },
          ),
        );
      },
    );
  }
}

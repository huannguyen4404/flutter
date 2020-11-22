import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      itemBuilder: (context, index) {
        return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: (index) % 2 == 0 ? Colors.green : Colors.blue,
            elevation: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(padding: EdgeInsets.all(10)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Text(
                      items[index].content,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                        'Date: ${DateFormat.yMd().format(items[index].createdAt)}',
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    Padding(padding: EdgeInsets.only(bottom: 10)),
                  ],
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          '${items[index].money}\$',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(right: 10))
                    ],
                  ),
                )
              ],
            ));
      },
    );
  }
}

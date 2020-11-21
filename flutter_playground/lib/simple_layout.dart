import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_playground/item.dart';
import 'package:flutter_playground/item_list.dart';

class MyLayout extends StatefulWidget {
  @override
  _MyLayoutState createState() => _MyLayoutState();
}

class _MyLayoutState extends State<MyLayout> {
  // States
  Item _item = Item(content: '', money: 0.0);
  List<Item> _items = List<Item>();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _contentController = TextEditingController();
  final _moneyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stateful Widget',
      home: Scaffold(
        key: _scaffoldKey,
        body: SafeArea(
          minimum: EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Content'),
                  controller: _contentController,
                  onChanged: (text) {
                    setState(() {
                      _item.content = text;
                    });
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Earned money'),
                  controller: _moneyController,
                  onChanged: (text) {
                    setState(() {
                      _item.money = double.tryParse(text) ?? 0;
                    });
                  },
                ),
                Padding(padding: const EdgeInsets.symmetric(vertical: 10)),
                ButtonTheme(
                  height: 50,
                  child: FlatButton(
                    child: Text("Collect"),
                    color: Colors.purple,
                    textColor: Colors.white,
                    onPressed: () {
                      setState(() {
                        _items.add(_item);
                        _item = Item(content: '', money: 0.0);
                        _contentController.text = '';
                        _moneyController.text = '';
                      });
                      _scaffoldKey.currentState.showSnackBar(SnackBar(
                        content: Text('Added: ${_items.toString()}'),
                        duration: Duration(seconds: 3),
                      ));
                    },
                  ),
                ),
                ItemList(items: _items),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

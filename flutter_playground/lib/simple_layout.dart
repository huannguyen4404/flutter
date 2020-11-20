import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'item.dart';

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
              Column(
                children: _items.map((item) {
                  return ListTile(
                    leading: const Icon(Icons.check),
                    title: Text(item.content),
                    subtitle: Text('${item.money} \$'),
                    onTap: () {
                      print('Item: ${item.content}');
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

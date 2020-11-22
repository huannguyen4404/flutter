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

  void _addItem() {
    // basic validation
    if (_item.content.isEmpty || _item.money == 0.0 || _item.money.isNaN) {
      return;
    }

    setState(() {
      _item.createdAt = DateTime.now();
      _items.add(_item);
      _item = Item(content: '', money: 0.0);
      _contentController.text = '';
      _moneyController.text = '';
    });
  }

  void _showBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          // TODO: Separate form to a widget file.
          return Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(labelText: 'Content'),
                  controller: _contentController,
                  onChanged: (text) {
                    setState(() {
                      _item.content = text;
                    });
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(labelText: 'Amount(money)'),
                  controller: _moneyController,
                  onChanged: (text) {
                    setState(() {
                      _item.money = double.tryParse(text) ?? 0;
                    });
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: SizedBox(
                        child: RaisedButton(
                          color: Colors.teal,
                          child: Text(
                            'Save',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          onPressed: () {
                            print('press Save');
                            this._addItem();
                            //dismiss after inserting
                            Navigator.of(context).pop();
                          },
                        ),
                        height: 50,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Expanded(
                      child: SizedBox(
                        child: RaisedButton(
                          color: Colors.pinkAccent,
                          child: Text(
                            'Cancel',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          onPressed: () {
                            print('Press cancel');
                            Navigator.of(context).pop();
                          },
                        ),
                        height: 50,
                      ),
                    )
                  ],
                ),
              ),
              //ok button
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Item List'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _showBottomSheet(),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Press to Add',
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
        onPressed: () => _showBottomSheet(),
      ),
      body: SafeArea(
        minimum: EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ItemList(items: _items),
            ],
          ),
        ),
      ),
    );
  }
}

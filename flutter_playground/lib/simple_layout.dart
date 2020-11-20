import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyLayout extends StatefulWidget {
  @override
  _MyLayoutState createState() => _MyLayoutState();
}

class _MyLayoutState extends State<MyLayout> {
  // States
  String _content;
  double _money;

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
                    _content = text;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Earned money'),
                controller: _moneyController,
                onChanged: (text) {
                  setState(() {
                    _money = double.tryParse(text) ?? 0;
                  });
                },
              ),
              FlatButton(
                child: Text("Collect"),
                color: Colors.purple,
                textColor: Colors.white,
                onPressed: () {
//                  print('Presses');
                  _scaffoldKey.currentState.showSnackBar(SnackBar(
                    content: Text('Content: $_content, money: $_money'),
                    duration: Duration(seconds: 3),
                  ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

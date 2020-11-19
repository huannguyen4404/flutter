import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  String name;
  int age;

  MyWidget({this.name, this.age});

  @override
  State<StatefulWidget> createState() {
    return _MyWidgetState();
  }
}

class _MyWidgetState extends State<MyWidget> {
  String _email = ''; // state

  final emailEditingCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stateful Widget',
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${widget.name} - ${widget.age} Stateful Widget.',
                style: TextStyle(fontSize: 30, color: Colors.blueAccent),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  // controller: emailEditingCtl,
                  onChanged: (text) => this.setState(() {
                    _email = text; // re-run build()
                  }),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelText: 'Enter email',
                  ),
                ),
              ),
              Text(
                _email,
                style: TextStyle(fontSize: 30, color: Colors.green),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class MyDate extends StatefulWidget {
  @override
  _MyDateState createState() => _MyDateState();
}

class _MyDateState extends State<MyDate> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime otherDate = DateTime(2020, 11, 20);

    return MaterialApp(
      title: "Henry datetime widget",
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                DateFormat.yMMMd().format(now),
                style: TextStyle(fontSize: 25, color: Colors.blueAccent),
              ),
              Text(
                NumberFormat('###.0##', 'en_US').format(12.345678),
                style: TextStyle(fontSize: 25, color: Colors.greenAccent),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

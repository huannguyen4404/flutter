import 'package:counter_app/blocs/counter_bloc.dart';
import 'package:counter_app/counter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CounterApp',
      home: BlocProvider<CounterBloc>(
        create: (ctx) => CounterBloc(),
        child: CounterScreen(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import './simple_form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Samples: state - simple form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sample: state - simple form'),
        ),
        body: SimpleForm(),
      ),
    );
  }
}

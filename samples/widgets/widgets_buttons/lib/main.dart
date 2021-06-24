import 'package:flutter/material.dart';
import './buttons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Samples: widgets - buttons',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Buttons(),
    );
  }
}

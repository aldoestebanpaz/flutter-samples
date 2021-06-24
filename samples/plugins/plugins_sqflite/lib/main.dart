import 'package:flutter/material.dart';
import './sqflite_samples.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Samples: plugins - sqflite',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SqfliteSamples()
    );
  }
}

import 'package:flutter/material.dart';
import './texts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Samples: widgets - texts and fonts',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sample: widgets - texts and fonts'),
        ),
        body: Texts(),
      ),
    );
  }
}

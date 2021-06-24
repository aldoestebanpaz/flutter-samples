import 'package:flutter/material.dart';
import './containers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Samples: widgets - containers',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sample: widgets - containers'),
        ),
        body: Containers(),
      ),
    );
  }
}

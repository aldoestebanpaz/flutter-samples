import 'package:flutter/material.dart';
import './listview_usage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Samples: widgets - ListView',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sample: widgets - ListView'),
        ),
        body: ListViewUsage(),
      ),
    );
  }
}

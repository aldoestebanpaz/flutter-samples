import 'package:flutter/material.dart';
import './columns.dart';
import './rows.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Samples: widgets - columns and rows',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sample: widgets - columns and rows'),
        ),
        body: Column(
          children: <Widget>[Columns(), Divider(color: Colors.red), Rows()]
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:screens_simple/screens/list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Samples: screens - simple',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListScreen()
    );
  }
}

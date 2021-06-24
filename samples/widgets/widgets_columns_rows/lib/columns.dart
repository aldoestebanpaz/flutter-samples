import 'package:flutter/material.dart';

class Columns extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Column has fixed vertical direction while placing its widgets
        Column(
          children: <Widget>[
            Text('Column 1-a'),
            Text('Column 1-end'),
          ]
        ),
        Divider(color: Colors.black),
        Column(
          verticalDirection: VerticalDirection.up,
          children: <Widget>[
            Text('Column 1-a'),
            Text('Column 1-end'),
          ]
        ),
        Divider(color: Colors.black),
        Container(
          height: 80,
          color: Colors.green,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end, //Center Column contents vertically,
            crossAxisAlignment: CrossAxisAlignment.start, //Center Column contents horizontally,
            children: <Widget>[
              Text('Column 2-a'),
              Text('Column 2-b'),
              Text('Column 2-c'),
              Text('Column 2-end'),
            ]
          ),
        ),
        Divider(color: Colors.black),
        Container(
          height: 80,
          color: Colors.green,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start, //Center Column contents vertically,
            crossAxisAlignment: CrossAxisAlignment.end, //Center Column contents horizontally,
            children: <Widget>[
              Text('Column 2-a'),
              Text('Column 2-b'),
              Text('Column 2-c'),
              Text('Column 2-end'),
            ]
          ),
        ),
      ]
    );
  }
}

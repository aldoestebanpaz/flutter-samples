import 'package:flutter/material.dart';

class Rows extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          // Row has fixed horizontal direction while placing its widgets
          Row(
            children: <Widget>[
              Text('Row 1-a'),
              Text('Row 1-b'),
              Text('Row 1-c'),
            ]
          ),
          Divider(color: Colors.black),
          Container(
            height: 30,
            color: Colors.yellow,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
              crossAxisAlignment: CrossAxisAlignment.end, //Center Row contents vertically,
              children: <Widget>[
                Text('Row 2-a'),
                Text('Row 2-b'),
                Text('Row 2-c'),
              ]
            ),
          ),
          Divider(color: Colors.black),
          Container(
            height: 30,
            color: Colors.yellow,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, //Center Row contents horizontally,
              crossAxisAlignment: CrossAxisAlignment.start, //Center Row contents vertically,
              children: <Widget>[
                Text('Row 2-a'),
                Text('Row 2-b'),
                Text('Row 2-c'),
              ]
            ),
          ),
          Divider(color: Colors.black),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround, //Center Row contents horizontally,
            children: <Widget>[
              Text('Row 2-a'),
              Text('Row 2-b'),
              Text('Row 2-c'),
            ]
          ),
          Divider(color: Colors.black),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, //Center Row contents horizontally,
            children: <Widget>[
              Text('Row 2-a'),
              Text('Row 2-b'),
              Text('Row 2-c'),
            ]
          ),
          Divider(color: Colors.black),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text('Row 3-a'),
              Expanded(child:
                Text(
                  'Row 3-b this is a child in an Expanded widget,'
                  + 'which tells the row that the child...'
                )
              ),
              Text('Row 3-c'),
            ]
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Text('Row 3-a'),
              ),
              Expanded(
                flex: 4,
                child: Text(
                  'Row 3-b this is a child in an Expanded widget,'
                  + 'which tells the row that the child...'
                )
              ),
              Expanded(
                child: Text('Row 3-c'),
              ),
            ]
          ),
        ],
      );
  }
}

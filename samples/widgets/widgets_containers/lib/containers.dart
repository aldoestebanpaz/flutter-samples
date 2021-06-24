import 'package:flutter/material.dart';

class Containers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Container(
            color: Colors.green[600],
            child: Text('Text 1')
          ),
          Container(
            color: Colors.purple[600],
            padding: const EdgeInsets.all(8.0),
            child: Text('Text 2')
          ),
          Container(
            color: Colors.indigo[600],
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(8.0),
            child: Text('Text 3')
          ),
          Container(
            // color: Colors.indigo[600], cannot use both color and decoration-color properties
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: const Color(0xff7c94b6),
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: Text('Text 4')
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 66, 165, 245),
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
            width: 100.0,
            height: 100.0,
            child: Text('Text 5')
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(0xFF, 0xFF, 0xA5, 0xF5),
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
            width: 100.0,
            height: 100.0,
            alignment: Alignment.center,
            child: Text('Text 6')
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(165, 165, 245, 1.0),
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
            width: 100.0,
            height: 100.0,
            alignment: Alignment.center,
            transform: Matrix4.rotationZ(0.1),
            child: Text('Text 7')
          ),
        ],
      );
  }
}

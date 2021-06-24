import 'package:flutter/material.dart';

class Texts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Text('Text 1'),
          Text('Text 2 - GitHub is a development platform inspired by the way you work. From '
            + 'open source to business, you can host and review code...',
            textDirection: TextDirection.ltr
          ),
          Text('Text 2 - GitHub is a development platform inspired by the way you work. From '
            + 'open source to business, you can host and review code...',
            textDirection: TextDirection.rtl
          ),
          Text(
            'Text 3 - colors',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
              backgroundColor: Colors.purple,
              decoration: TextDecoration.underline
            ),
          ),
          Text(
            'Text 3 - colors',
            style: TextStyle(
              fontSize: 20.0,
              foreground: Paint()
                ..color = Colors.white,
              background: Paint()
                ..color = Colors.purple,
              decoration: TextDecoration.underline
            ),
          ),
          Text(
            'Text 4 - stroke',
            style: TextStyle(
              fontSize: 22,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 1
                ..color = Colors.blue[700]!,
              decoration: TextDecoration.underline,
              decorationColor: Colors.red
            ),
          ),
          Text(
            'Text 5 - font: Oxygen',
            style: TextStyle(
              fontSize: 20.0,
              fontFamily: 'Oxygen',
              // default fontWeight is w400 = normal
            ),
          ),
          Text(
            'Text 5 - font: Oxygen',
            style: TextStyle(
              fontSize: 20.0,
              fontFamily: 'Oxygen',
              fontWeight: FontWeight.w300
            ),
          ),
          Text(
            'Text 5 - font: Oxygen',
            style: TextStyle(
              fontSize: 20.0,
              fontFamily: 'Oxygen',
              fontWeight: FontWeight.bold // w700
            ),
          ),
          Text(
            'Text 6 - font: Pattaya',
            style: TextStyle(
              fontSize: 18.0,
              fontFamily: 'Pattaya'
            ),
          ),
          Text(
            'Text 7 - font: Simonetta',
            style: TextStyle(
              fontSize: 22.0,
              fontFamily: 'Simonetta'
            ),
          ),
          Text(
            'Text 7 - font: Simonetta',
            style: TextStyle(
              fontSize: 22.0,
              fontFamily: 'Simonetta',
              fontStyle: FontStyle.italic
            ),
          ),
          Text(
            'Text 7 - font: Simonetta',
            style: TextStyle(
              fontSize: 22.0,
              fontFamily: 'Simonetta',
              fontWeight: FontWeight.w900
            ),
          ),
          Text(
            'Text 7 - font: Simonetta',
            style: TextStyle(
              fontSize: 22.0,
              fontFamily: 'Simonetta',
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic
            ),
          ),
          Text.rich( // Using the Text.rich constructor, the Text widget can display a paragraph with differently styled TextSpans
            TextSpan(
              text: 'Hello', // default text style
              children: <TextSpan>[
                TextSpan(text: ' beautiful ', style: TextStyle(fontStyle: FontStyle.italic)),
                TextSpan(text: 'world', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Hello',
              style: TextStyle(
                color: Colors.lightBlue,
              ),
              children: <TextSpan>[
                TextSpan(text: ' beautiful ', style: TextStyle(fontStyle: FontStyle.italic)),
                TextSpan(text: 'world', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'GitHub is a development platform inspired by the way you work. From ',
              style: TextStyle(
                  color: Colors.grey,
                  backgroundColor: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                  text: 'open source',
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline
                  ),
                ),
                TextSpan(text: ' to '),
                TextSpan(
                  text: 'business,',
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline
                  ),
                ),
                TextSpan(text: ' you can host and review code...')
              ]
            ),
          )
        ],
      );
  }
}

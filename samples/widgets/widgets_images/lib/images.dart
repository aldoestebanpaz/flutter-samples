import 'dart:convert';
import 'package:flutter/material.dart';
import './constants.dart';
import './image_from_file.dart';
import 'image_from_provider.dart';

class Images extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Row(children: <Widget>[
            Image.asset('images/174677.png', width: 100, height: 100),
            Text('Assets')
          ]),
          Row(children: <Widget>[
            Image.network('https://openclipart.org/image/400px/215664', width: 100, height: 100),
            Text('Network')
          ]),
          Row(children: <Widget>[
            Image.memory(base64Decode(BASE64_IMAGE), width: 100, height: 100),
            Text('Memory')
          ]),
          Row(children: <Widget>[
            ImageFromFile(),
            Text('File')
          ]),
          Row(children: <Widget>[
            Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/d/dc/Blue_Sky_White_Sun.png/640px-Blue_Sky_White_Sun.png', width: 100, height: 100),
            Container(
              color: Colors.purple,
              child: Image(
                image: ImageFromProvider(
                  NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/d/dc/Blue_Sky_White_Sun.png/640px-Blue_Sky_White_Sun.png')
                ),
                width: 100, height: 100
              )
            ),
            Text('Provider')
          ]),
        ],
      );
  }
}

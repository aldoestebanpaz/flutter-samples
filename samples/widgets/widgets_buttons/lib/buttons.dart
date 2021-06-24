import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:developer';

class Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample: widgets - buttons'),
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (context) =>
              ['Say Hello'].map((item) =>
                PopupMenuItem<String>(
                  value: item,
                  child: Text(item)
                )
              ).toList(),
            onSelected: (_) => sayHello(context),
          )
        ]
      ),
      body: generateBody(context),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Sample of floating acction button',
        child: const Icon(Icons.add),
        onPressed: () {  },
      ),
    );
  }

  Widget generateBody(BuildContext context) {
    return Column(
      children: <Widget>[
        ElevatedButton(
          onPressed: () => sayHello(context),
          child: const Text('Say hello'),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
          ),
          onPressed: () => sayHello(context),
          child: const Text('Say hello'),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
            elevation: MaterialStateProperty.all(5),
          ),
          onPressed: () => sayHello(context),
          child: const Text('Say hello'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 20),
            primary: Colors.lightBlue,
            elevation: 5
          ),
          onPressed: () => sayHello(context),
          child: const Text('Say hello'),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
          ),
          onPressed: null,
          child: const Text('Disabled'),
        ),
        OutlinedButton(
          onPressed: () {
            print('print: Received click'); // run `flutter logs` to see this message
          },
          child: const Text('Print log message'),
        ),
        OutlinedButton(
          onPressed: null,
          child: const Text('Disabled'),
        ),
        TextButton(
          onPressed: () {
            debugPrint('debugPrint: Received click');
          },
          child: const Text('Debugprint message'),
        ),
        TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(16.0),
            primary: Colors.green,
            textStyle: const TextStyle(fontSize: 20),
          ),
          onPressed: () {
            log('log: Received click');
          },
          child: const Text('Log message'),
        ),
        TextButton(
          onPressed: null,
          child: const Text('Disabled'),
        ),
      ]
    );
  }

  void sayHello(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('Ey Hi!'),
        content: Text('Hello Flutter.')
      )
    );
  }
}

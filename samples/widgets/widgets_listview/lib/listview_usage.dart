import 'package:flutter/material.dart';

import './constants.dart';

// ignore: must_be_immutable
class ListViewUsage extends StatelessWidget {
  List<Map<String, dynamic>> entries = Constants.entries;
  late int itemsCount = /*0;*/ this.entries.length;

  @override
  Widget build(BuildContext context) {
    return itemsCount > 0 ? ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: itemsCount,
      itemBuilder: (BuildContext context, int index) => Card(
        elevation: 3,
        child: Column(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.lightBlue,
                child: Text(entries[index]['avatar_number'].toString())
              ),
              title: Text(entries[index]['title']),
              subtitle: Text(entries[index]['subtitle']),
              onTap: () => debugPrint('Tapped on ${entries[index]['id']}'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('SHOW DETAILS'),
                  onPressed: () => sayHello(context, entries[index]['id']),
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        )
      )
    )
    : const Center(child: Text('No items'));
  }

  void sayHello(BuildContext context, int id) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('Ey Hi!'),
        content: Text('Item ID: $id')
      )
    );
  }
}

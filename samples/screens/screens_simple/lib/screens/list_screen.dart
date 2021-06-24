import 'package:flutter/material.dart';

import 'package:screens_simple/constants.dart';
import 'package:screens_simple/screens/detail_screen.dart';


// ignore: must_be_immutable
class ListScreen extends StatelessWidget {
  List<Map<String, dynamic>> entries = Constants.entries;
  late int itemsCount = /*0;*/ this.entries.length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample: screens - simple'),
      ),
      body: generateBody()
    );
  }

  Widget generateBody() {
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
              onTap: () {
                debugPrint('Tapped on ${entries[index]['id']}');
                navigateToDetail(context, entries[index]);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('SHOW DETAILS'),
                  onPressed: () => navigateToDetail(context, entries[index]),
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

  void navigateToDetail(context, data) async {
    // String resultFromDetailScreen = Navigator.of(context).push(
    //   MaterialPageRoute(builder: (context) => DetailScreen(data))
    // );

    // Animate a page route transition from right to left
    String resultFromDetailScreen = await Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => DetailScreen(data),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(1.0, 0.0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      )
    );

    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('Ey! Welcome back'),
        content: Text(resultFromDetailScreen)
      )
    );
  }
}

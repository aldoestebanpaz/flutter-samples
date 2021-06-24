import 'package:flutter/material.dart';

class Gestures extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GesturesState();
}

class _GesturesState extends State<Gestures> {
  late int tapsCount;
  late int doubleTapsCount;
  late int longPressCount;
  late double currentPosX;
  late double currentPosY;
  final GlobalKey bottomNavigationBarKey = GlobalKey();
  final double boxSize = 150.0;

  @override
  void initState() {
    super.initState();
    tapsCount = 0;
    doubleTapsCount = 0;
    longPressCount = 0;
    currentPosX = 0.0;
    currentPosY = 0.0;
    WidgetsBinding.instance!.addPostFrameCallback((_) => centerBox());
  }

  void centerBox() {
    Size? size = bottomNavigationBarKey.currentContext!.size;
    setState(() {
      currentPosX = (MediaQuery.of(context).size.width / 2) - (boxSize / 2);
      currentPosY = (MediaQuery.of(context).size.height / 2) - (boxSize / 2) - size!.height;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample: gestures - simple'),
      ),
      body: GestureDetector(
        onTap: () => setState(() { tapsCount++; }),
        onDoubleTap: () => setState(() { doubleTapsCount++; }),
        onLongPress: () => setState(() { longPressCount++; }),
        // onHorizontalDragUpdate: (value) => setState(() { currentPosX += value.delta.dx; }),
        // onVerticalDragUpdate: (value) => setState(() { currentPosY += value.delta.dy; }),
        onPanUpdate: (value) => setState(() { currentPosX += value.delta.dx; currentPosY += value.delta.dy; }),
        child: Stack(
          children: <Widget>[
            Positioned(
              left: currentPosX,
              top: currentPosY,
              child: Container(
                width: boxSize, height: boxSize,
                decoration: BoxDecoration(color: Colors.red),
              ),
            )
          ],
        )
      ),
      bottomNavigationBar: Material(
        key: bottomNavigationBarKey,
        color: Theme.of(context).primaryColorLight,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Text(
            'Taps: $tapsCount - DoubleTaps: $doubleTapsCount - Long Presses: $longPressCount',
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
      ),
    );
  }
}

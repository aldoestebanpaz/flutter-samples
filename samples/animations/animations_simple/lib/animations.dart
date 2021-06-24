import 'package:flutter/material.dart';

class Animations extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnimationsState();
}

class _AnimationsState extends State<Animations> with SingleTickerProviderStateMixin {

  late AnimationController animationController;
  late Animation<double> animation;

  late double currentPosX;
  late double currentPosY;
  late double currentBoxSize;
  final double maxBoxSize = 150.0;

  @override
  void initState() {
    super.initState();

    currentPosX = 0.0;
    currentPosY = 0.0;
    currentBoxSize = 0.0;

    animationController = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this
    );

    animation = CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    animation.addListener(() {
      setState(() {
        currentBoxSize = maxBoxSize * animation.value;
        centerBox();
      });
    });
    animationController.forward(); // start animation
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void centerBox() {
    setState(() {
      currentPosX = (MediaQuery.of(context).size.width / 2) - (currentBoxSize / 2);
      currentPosY = (MediaQuery.of(context).size.height / 2) - (currentBoxSize / 2);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentPosX == 0.0) { // center since first time of rendering
      centerBox();
    }

    return Stack(
      children: <Widget>[
        Positioned(
          left: currentPosX,
          top: currentPosY,
          child: Container(
            width: currentBoxSize, height: currentBoxSize,
            decoration: BoxDecoration(color: Colors.red),
          ),
        )
      ],
    );
  }
}

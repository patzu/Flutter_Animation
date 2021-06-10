import 'package:flutter/material.dart';

class AnimationControllerForwardTicker extends StatefulWidget {
  static String id = 'AnimationControllerForwardTicker';

  @override
  _AnimationControllerForwardTickerState createState() =>
      _AnimationControllerForwardTickerState();
}

class _AnimationControllerForwardTickerState
    extends State<AnimationControllerForwardTicker>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    animationController.forward();

    animationController.addListener(() {
      print(animationController.value);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.lightGreenAccent,
      backgroundColor:
          Colors.lightGreenAccent.withOpacity(animationController.value),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Image.asset('assets/logo.png'),
              height: animationController.value * 200,
            ),
          ],
        ),
      ),
    );
  }
}

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
      upperBound: 100,
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
      backgroundColor: Colors.lightGreenAccent,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo.png'),
                Text(
                  '${animationController.value.toInt()}%',
                  style: TextStyle(
                    fontSize: 45,
                  ),
                ),
              ],
            ),
            height: animationController.value,
          ),
        ),
      ),
    );
  }
}

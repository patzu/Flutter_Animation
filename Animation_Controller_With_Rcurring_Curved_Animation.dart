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
  Animation animation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    animationController.forward();

    animation = CurvedAnimation(
      parent: animationController,
      // curve: Curves.decelerate,
      curve: Curves.bounceOut,
      // curve: Curves.bounceIn,
    );

    animationController.addStatusListener((status) {
      if (AnimationStatus.completed == status) {
        animationController.reverse(from: 1);
      } else if (AnimationStatus.dismissed == status) {
        animationController.forward();
      }
    });

    animationController.addListener(() {
      setState(() {});
    });
  }


  @override
  void dispose() {
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent.withOpacity(
        animation.value,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo.png'),
                Text(
                  '100%',
                  style: TextStyle(
                    fontSize: 45,
                  ),
                ),
              ],
            ),
            height: animation.value * 100,
          ),
        ),
      ),
    );
  }
}

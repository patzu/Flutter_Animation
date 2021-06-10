import 'package:flutter/material.dart';

class AnimationControllerWithColorTweens extends StatefulWidget {
  static String id = 'AnimationControllerForwardTicker';

  @override
  _AnimationControllerWithColorTweensState createState() =>
      _AnimationControllerWithColorTweensState();
}

class _AnimationControllerWithColorTweensState
    extends State<AnimationControllerWithColorTweens>
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

    animation = ColorTween(
      begin: Colors.white,
      end: Colors.deepOrangeAccent,
    ).animate(animationController);

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
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
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
            height: 100,
          ),
        ),
      ),
    );
  }
}

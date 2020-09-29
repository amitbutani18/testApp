import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rainbow_color/rainbow_color.dart';

class CustomListView extends StatefulWidget {
  @override
  _CustomListViewState createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView>
    with TickerProviderStateMixin {
  bool _click = false;
  Animation animation,
      animation2,
      animation3,
      animation4,
      animation5,
      animation6,
      animation7,
      animation8;
  Animation colorAnimation;
  AnimationController rotationController, animationController, colorController;
  Animation btn1, btn2, btn3, btn4, btn5, btn6, btn7, btn8;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final num height = MediaQueryData.fromWindow(window).size.height;
    final num width = MediaQueryData.fromWindow(window).size.width;
    // print(height);

    rotationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    colorController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    )..repeat(reverse: true);
    animation = setOffset(width - 222, height - 435, width - 222, height - 517);

    animation2 =
        setOffset(width - 222, height - 435, width - 140, height - 435);

    animation3 =
        setOffset(width - 222, height - 435, width - 222, height - 355);

    animation4 =
        setOffset(width - 222, height - 435, width - 300, height - 435);

    animation5 =
        setOffset(width - 222, height - 435, width - 340, height - 550);
    animation6 =
        setOffset(width - 222, height - 435, width - 340, height - 320);
    animation7 =
        setOffset(width - 222, height - 435, width - 110, height - 320);
    animation8 =
        setOffset(width - 222, height - 435, width - 110, height - 550);

    btn1 = setColor([
      Colors.purple,
      Colors.amber,
      Colors.teal,
      Colors.green,
      Colors.red,
      Colors.blue,
    ]);
    btn2 = setColor([
      Colors.teal,
      Colors.purple,
      Colors.green,
      Colors.red,
      Colors.blue,
      Colors.amber
    ]);
    btn3 = setColor([
      Colors.purple,
      Colors.blue,
      Colors.teal,
      Colors.green,
      Colors.red,
      Colors.amber
    ]);
    btn4 = setColor([
      Colors.purple,
      Colors.green,
      Colors.blue,
      Colors.teal,
      Colors.amber,
      Colors.red,
    ]);
    btn5 = setColor([
      Colors.blue,
      Colors.teal,
      Colors.amber,
      Colors.purple,
      Colors.green,
      Colors.red,
    ]);
    btn6 = setColor([
      Colors.teal,
      Colors.amber,
      Colors.purple,
      Colors.green,
      Colors.red,
      Colors.blue,
    ]);
    btn7 = setColor([
      Colors.purple,
      Colors.teal,
      Colors.green,
      Colors.amber,
      Colors.red,
      Colors.blue,
    ]);
    btn8 = setColor([
      Colors.purple,
      Colors.green,
      Colors.red,
      Colors.blue,
      Colors.teal,
      Colors.amber
    ]);
  }

  setOffset(x1, y1, x2, y2) {
    return Tween<Offset>(begin: Offset(x1, y1), end: Offset(x2, y2))
        .animate(animationController)
          ..addListener(() {
            setState(() {});
          });
  }

  setColor(List<Color> list) {
    return RainbowColorTween(list).animate(colorController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          colorController.reverse();
        }
        if (status == AnimationStatus.dismissed) {
          colorController.forward();
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    print("height" + height.toString());
    return Scaffold(
      backgroundColor: Colors.black,
      body: RotationTransition(
        turns: Tween(begin: 0.0, end: 1.0).animate(rotationController),
        child: Container(
          child: Stack(
            children: [
              CustomIcon(
                animation: animation,
                color: Colors.red,
                colorAnimation: btn1,
              ),
              CustomIcon(
                animation: animation2,
                color: Colors.amber,
                colorAnimation: btn2,
              ),
              CustomIcon(
                animation: animation3,
                color: Colors.teal,
                colorAnimation: btn3,
              ),
              CustomIcon(
                  animation: animation4,
                  color: Colors.cyan,
                  colorAnimation: btn4),
              CustomIcon(
                  animation: animation5,
                  color: Colors.deepPurple,
                  colorAnimation: btn5),
              CustomIcon(
                  animation: animation6,
                  color: Colors.purpleAccent,
                  colorAnimation: btn6),
              CustomIcon(
                  animation: animation7,
                  color: Colors.amber[800],
                  colorAnimation: btn7),
              CustomIcon(
                  animation: animation8,
                  color: Colors.lightGreen,
                  colorAnimation: btn8),
              Positioned(
                left: width - 222,
                top: height - 435,
                child: FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        if (_click) {
                          animationController.reverse();
                          rotationController.reverse();
                          _click = false;
                        } else {
                          animationController.forward();
                          colorController.forward();
                          rotationController.forward(from: 0.0);
                          _click = true;
                        }
                      });
                    },
                    child: Icon(Icons.play_arrow)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomIcon extends StatelessWidget {
  final Animation animation;
  final Animation colorAnimation;
  final Color color;
  CustomIcon({this.animation, this.color, this.colorAnimation});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: animation.value.dx,
      top: animation.value.dy,
      child: FloatingActionButton(
          backgroundColor: colorAnimation.value,
          onPressed: () {},
          child: Icon(Icons.ac_unit)),
    );
  }
}

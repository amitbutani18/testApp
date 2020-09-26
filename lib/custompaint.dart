import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/material.dart';

class CustomPaintWidget extends StatefulWidget {
  @override
  _CustomPaintWidgetState createState() => _CustomPaintWidgetState();
}

class _CustomPaintWidgetState extends State<CustomPaintWidget>
    with TickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  Animation<double> animation1;
  AnimationController controller1;

  Animation<Offset> offsetAnimation;
  AnimationController controller3;

  Tween<double> _rotationTween = Tween(begin: -3.14, end: 3.14);
  Tween<double> _radiusTween = Tween(begin: 0.0, end: 100);
  bool _click = false;
  double _sides = 3.0;
  var _radius = 25.0;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    controller1 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    controller3 =
        AnimationController(vsync: this, duration: Duration(seconds: 4))
          ..repeat(reverse: true);

    offsetAnimation =
        Tween<Offset>(begin: Offset(0.0, -0.2), end: Offset(0.0, 0.8))
            .animate(CurvedAnimation(
      parent: controller3,
      curve: Curves.elasticInOut,
    ));

    animation = _rotationTween.animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });

    animation1 = _radiusTween.animate(controller1)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller1.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller1.forward();
        }
      });

    controller.forward();
    controller1.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   setState(() {
      //     _click = _click ? false : true;
      //   });
      // }),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child:
                // SlideTransition(
                //   position: offsetAnimation,
                //   child:
                CustomPaint(
              painter: ShapePainter(
                  side: _sides,
                  radies: animation1.value,
                  animation: animation.value),
              child: Container(),
            ),
            // ),
          ),
          Expanded(
            child: CustomPaint(
              painter: Rectangle(),
            ),
          ),
          Slider(
            activeColor: Colors.teal,
            value: _sides,
            onChanged: (value) {
              setState(() {
                _sides = value;
              });
            },
            min: 3.0,
            max: 10,
          ),
          // Slider(
          //   activeColor: Colors.teal,
          //   value: _radius,
          //   onChanged: (value) {
          //     setState(() {
          //       _radius = value;
          //     });
          //   },
          //   min: 1,
          //   max: MediaQuery.of(context).size.width / 2,
          // )
        ],
      ),
    );
  }
}

class Rectangle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {}

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class ShapePainter extends CustomPainter {
  double side;
  double radies;
  double animation;
  ShapePainter({this.side, this.radies, this.animation});
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var paintCircle = Paint()
      ..color = Colors.red
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    var path = Path();
    var angle = (math.pi * 2) / side;

    Offset center = Offset(size.width / 2, size.height / 2);
    Offset startPoint =
        Offset(radies * math.cos(animation), radies * math.sin(animation));
    // print("startPoint.dx -----------------------------" +
    //     startPoint.dx.toString());
    // print("startPoint.dy -----------------------------" +
    //     startPoint.dy.toString());
    // print("center.dx " + center.dx.toString());
    // print("center.dy " + center.dy.toString());

    path.moveTo(startPoint.dx + center.dx, startPoint.dy + center.dy);

    for (int i = 1; i <= side; i++) {
      double x = radies * math.cos(animation + angle * i) + center.dx;
      double y = radies * math.sin(animation + angle * i) + center.dy;
      path.lineTo(
        x,
        y,
      );
    }
    path.close();

    // var path = Path();
    // path.addOval(
    //   Rect.fromCircle(
    //     center: center,
    //     radius: 100,
    //   ),
    // );
    canvas.drawPath(path, paint);

    Offset endingPoint = Offset(size.width, size.height / 2);

    var pathCircle = Path();
    pathCircle.addOval(Rect.fromCircle(
      radius: radies,
      // width: 200,
      // height: 400,
      center: Offset(size.width / 2, size.height / 2),
    ));
    canvas.drawPath(pathCircle, paintCircle);

    var paintCube = Paint()
      ..color = Colors.white
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    var pathCube = Path();
    pathCube.cubicTo(size.width / 4, 3 * size.height / 4, 3 * size.width / 4,
        size.height / 4, size.width, size.height);
    // canvas.drawPath(path, paint);
    // print(angle);

    canvas.drawPath(pathCube, paintCube);
    // canvas.drawCircle(center, 100, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

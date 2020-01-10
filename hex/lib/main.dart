import 'dart:math' show min;

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hex',
      home: Scaffold(
        appBar: AppBar(),
        body: LayoutBuilder(
          builder: (context, constraints) {
            // double r = constraints.maxWidth / 25;
            return Container(
              // Container(
              //   child: GestureDetector(
              //     onTap: () {
              //       print('tip');
              //     },
              //     child: CustomPaint(
              //         size: Size(100, 100), painter: DrawTriangle()),
              //   ),
              // ),
              child: Hex(
                3,
                constraints.maxHeight,
                constraints.maxWidth,
              ),
              // child: OffGrid((x, s) {
              //   return Circle(x, s);
              // }, [r, 0], r, 0, 11, 11),
            );
          },
        ),
      ),
    );
  }
}

class Hex extends StatelessWidget {
  int size;
  double h;
  double w;
  Hex(this.size, this.h, this.w);

  @override
  Widget build(BuildContext context) {
    size += 2;
    return Container(
      width: w,
      height: h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(2 * size - 1, (int i) {
          int k = i < size ? i + 1 : 2 * size - i - 1;
          double radius = h / size / 4;
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(k, (j) {
              bool mid = j > 0 && j < k - 1;
              if (mid) {
                return Circle(radius, 0, true);
              } else if ((j == 0) ^ (i < size)) {
                return Circle(radius, 1, false);
              }
              return Circle(radius, 2, false);
            }),
          );
        }),
      ),
    );
  }
}

class OffGrid extends StatelessWidget {
  Function func;
  List args;
  double dx;
  double dy;
  int x;
  int y;
  OffGrid(this.func, this.args, this.dx, this.dy, this.x, this.y);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(y, (i) {
          Row r = Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(x, (_) {
              return Function.apply(func, args);
            }),
          );
          if (i % 2 == 0) {
            return r;
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(x + 1, (_) {
              return Function.apply(func, args);
            }),
          );
          //return Transform.translate(
          //  offset: Offset(dx, dy),
          //   child: r,
          // );
        }),
      ),
    );
  }
}

class Circle extends StatefulWidget {
  final double radius;
  int state;
  bool modif;
  Circle(this.radius, this.state, this.modif);

  @override
  _CircleState createState() => _CircleState();
}

class _CircleState extends State<Circle> {
  @override
  Widget build(BuildContext context) {
    return widget.modif
        ? GestureDetector(
            onTap: () {
              setState(() {
                widget.state = (widget.state + 1) % 3;
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: widget.radius * 2,
              width: widget.radius * 2,
              decoration: BoxDecoration(
                color: widget.state == 0
                    ? Colors.white
                    : widget.state == 1 ? Colors.blue : Colors.red,
                borderRadius: BorderRadius.circular(10000),
                border: Border.all(color: Colors.black),
              ),
            ),
          )
        : Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: widget.radius * 2,
            width: widget.radius * 2,
            decoration: BoxDecoration(
              color: widget.state == 0
                  ? Colors.white
                  : widget.state == 1 ? Colors.blue : Colors.red,
              borderRadius: BorderRadius.circular(10000),
              border: Border.all(color: Colors.black),
            ),
          );
  }
}

class DrawTriangle extends CustomPainter {
  Paint _paint;

  DrawTriangle() {
    _paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.height, size.width);
    path.close();
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

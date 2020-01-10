import 'dart:math' show pi;

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hex',
      home: Scaffold(
        appBar: AppBar(),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: Container(
                child: Transform.rotate(
                  angle: pi / 6,
                  child: Hex(
                    11,
                    constraints.maxHeight,
                    constraints.maxWidth,
                  ),
                ),
              ),
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
              margin: EdgeInsets.symmetric(horizontal: 4),
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
            margin: EdgeInsets.symmetric(horizontal: 4),
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

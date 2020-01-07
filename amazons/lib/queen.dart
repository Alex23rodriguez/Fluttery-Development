import 'package:flutter/material.dart';

class Queen extends StatelessWidget {
  final Color color;

  Queen(this.color);

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   margin: EdgeInsets.all(4),
    //   child: CircleAvatar(
    //     backgroundColor: color,
    //   ),
    // );
    return LayoutBuilder(builder: (context, constraints) {
      print(constraints.maxHeight);
      return Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(constraints.maxHeight * 0.08),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(1000),
              color: color,
            ),
          ),
          Container(
            margin: EdgeInsets.all(constraints.maxHeight * 0.17),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(1000),
              color: color,
            ),
          )
        ],
      );
    });
  }
}

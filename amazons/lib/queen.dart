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
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(1000),
            color: color,
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(1000),
            color: color,
          ),
        )
      ],
    );
  }
}

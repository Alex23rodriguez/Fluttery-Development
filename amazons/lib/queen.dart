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
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(60),
        color: color,
      ),
    );
  }
}

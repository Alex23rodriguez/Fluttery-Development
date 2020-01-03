import 'package:flutter/material.dart';

class Queen extends StatelessWidget {
  final int team;

  Queen(this.team);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      child: CircleAvatar(
        backgroundColor: team == 1 ? Colors.red : Colors.purple,
      ),
    );
    // return Container(
    //   margin: EdgeInsets.all(5),
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(60),
    //     color: Colors.white,
    //   ),
    // );
  }
}

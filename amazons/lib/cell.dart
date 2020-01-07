import 'package:flutter/material.dart';

import './queen.dart';
import 'arrow.dart';
import 'board.dart';

class Cell extends StatelessWidget {
  static const int size = 8;

  final int id;
  final Color color;
  final Function callback;

  Cell(this.id, this.color, this.callback);

  get _child {
    if (color == null) {
      return null;
    }
    if (color == Colors.black) {
      return Arrow();
    }
    return Queen(color);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => callback(id),
      child: Container(
          color: (id % Board.size + (id / Board.size).floor()) % 2 == 0
              ? Colors.green
              : Colors.white,
          child: _child),
    );
  }
}

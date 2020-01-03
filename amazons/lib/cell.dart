import 'package:flutter/material.dart';

import './queen.dart';
import 'arrow.dart';
import 'board.dart';

class Cell extends StatelessWidget {
  final int id;
  final int state;
  final Function callback;

  Cell(this.id, this.state, this.callback);

  get _child {
    if (state == 0) {
      return null;
    }
    if (state == -1) {
      return Arrow();
    }
    return Queen(state);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => callback(id),
      child: Container(
          color: (id % Board.size + (id / Board.size).floor()) % 2 == 0
              ? Colors.green
              : Colors.white,
          child: _child), //Text('$id')),
    );
  }
}

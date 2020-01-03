import 'package:flutter/material.dart';
import './cell.dart';

class Board extends StatefulWidget {
  static const int size = 10;
  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  int selected;
  List<int> cells = init;

  static get init {
    List<int> cells = List.generate(Board.size * Board.size, (i) => 0);
    List<int> t1;
    List<int> t2;
    if (Board.size == 6) {
      t1 = [3, 12];
      t2 = [23, 32];
    } else if (Board.size == 8) {
      t1 = [3, 16, 23];
      t2 = [40, 47, 60];
    } else if (Board.size == 10) {
      t1 = [3, 6, 30, 39];
      t2 = [60, 69, 93, 96];
    } else {
      t1 = [];
      t2 = [];
    }

    for (int i = 0; i < t1.length; i++) {
      cells[t1[i]] = 1;
      cells[t2[i]] = 2;
    }
    return cells;
  }

  void _tapped(int i) {
    if (cells[i] > 0) {
      selected = i;
    } else {
      setState(() {
        if (selected == null) {
          cells[i] = -1 - cells[i];
        } else {
          cells[i] = cells[selected];
          cells[selected] = 0;
          selected = null;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: Board.size,
      children: List.generate(
          Board.size * Board.size, (i) => Cell(i, cells[i], _tapped)),
    );
  }
}

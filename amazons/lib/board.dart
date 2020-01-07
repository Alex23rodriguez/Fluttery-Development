import 'package:flutter/material.dart';
import './cell.dart';

class Board extends StatefulWidget {
  static const int size = 8;

  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  int selected;
  List<int> cells = init;

  static get init {
    List<int> cells = List.generate(Board.size * Board.size, (i) => null);
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
      cells[t2[i]] = -1;
    }
    return cells;
  }

  Color colors(i) {
    if (i == selected) {
      i = cells[i] * 2;
    } else {
      i = cells[i];
    }
    Color x;
    switch (i) {
      case 0:
        x = Colors.black;
        break;
      case 1:
        //x = Colors.purple;
        x = Colors.white;
        break;
      case 2:
        //x = Colors.purple[800];
        x = Colors.grey[350];
        break;
      case -1:
        x = Colors.red;
        break;
      case -2:
        x = Colors.red[900];
        break;
      default:
        x = null;
    }
    return x;
  }

  void _tapped(int i) {
    int x = cells[i];
    setState(() {
      if (x != null && x.abs() > 0) {
        // Tapped on a queen
        selected = i == selected ? null : i;
      } else if (selected != null) {
        // Move queen
        cells[i] = cells[selected];
        cells[selected] = null;
        selected = null;
      } else
        // place/delete arrow
        cells[i] = cells[i] == 0 ? null : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: Board.size,
      children: List.generate(
          Board.size * Board.size, (i) => Cell(i, colors(i), _tapped)),
    );
  }
}

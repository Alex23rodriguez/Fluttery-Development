import 'package:flutter/material.dart';

import './colors.dart';
import './cell.dart';

class Board extends StatefulWidget {
  final List<int> cells;
  final int boardSize;
  Board(this.cells, this.boardSize);
  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  int selected;
  int turn = 0; //0: white moves. 1: white places. 2: red moves. 3: red places

  void _tapped(i) {
    if (turn % 2 == 0 && widget.cells[i] != null && widget.cells[i].abs() > 0) {
      setState(() {
        selected = selected == i ? null : i;
      });
    }
  }

  void _tappedHL(i) {
    setState(() {
      if (turn % 2 == 0) {
        widget.cells[i] = widget.cells[selected];
        widget.cells[selected] = null;
        selected = i;
      } else {
        widget.cells[i] = 0;
        selected = null;
      }
    });
    turn = 1 - turn;
  }

  List<int> _coords(int i) {
    return [i % widget.boardSize, (i / widget.boardSize).floor()];
  }

  int _toid(int x, int y) {
    return y * widget.boardSize + x;
  }

  List<int> get _validMoves {
    List<int> hl = [];
    if (selected != null) {
      List<int> c = _coords(selected);

      int i = c[0] - 1;
      //left
      while (i >= 0 && widget.cells[_toid(i, c[1])] == null) {
        hl.add(_toid(i, c[1]));
        i -= 1;
      }
      i = c[0] + 1;
      //right
      while (i < widget.boardSize && widget.cells[_toid(i, c[1])] == null) {
        hl.add(_toid(i, c[1]));
        i += 1;
      }
      //up
      i = c[1] - 1;
      while (i >= 0 && widget.cells[_toid(c[0], i)] == null) {
        hl.add(_toid(c[0], i));
        i -= 1;
      }
      i = c[1] + 1;
      //down
      while (i < widget.boardSize && widget.cells[_toid(c[0], i)] == null) {
        hl.add(_toid(c[0], i));
        i += 1;
      }
      //ul
      i = 1;
      while (c[0] - i >= 0 &&
          c[1] - i >= 0 &&
          widget.cells[_toid(c[0] - i, c[1] - i)] == null) {
        hl.add(_toid(c[0] - i, c[1] - i));
        i += 1;
      }
      //ur
      i = 1;
      while (c[0] + i < widget.boardSize &&
          c[1] - i >= 0 &&
          widget.cells[_toid(c[0] + i, c[1] - i)] == null) {
        hl.add(_toid(c[0] + i, c[1] - i));
        i += 1;
      }
      //dl
      i = 1;
      while (c[0] - i >= 0 &&
          c[1] + i < widget.boardSize &&
          widget.cells[_toid(c[0] - i, c[1] + i)] == null) {
        hl.add(_toid(c[0] - i, c[1] + i));
        i += 1;
      }
      //dr
      i = 1;
      while (c[0] + i < widget.boardSize &&
          c[1] + i < widget.boardSize &&
          widget.cells[_toid(c[0] + i, c[1] + i)] == null) {
        hl.add(_toid(c[0] + i, c[1] + i));
        i += 1;
      }
    }
    return hl;
  }

  @override
  Widget build(BuildContext context) {
    List<int> moves = _validMoves;
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: widget.boardSize,
      children: List.generate(
        widget.boardSize * widget.boardSize,
        (i) => moves.indexOf(i) == -1
            ? Cell(i, colorElem(widget.cells[i], i == selected),
                colorCell(i, widget.boardSize), _tapped)
            : HighlightedCell(i, colorCell(i, widget.boardSize), _tappedHL),
      ),
    );
  }
}

/*
  void _tapped(int i) {
    int x = widget.cells[i];
    setState(() {
      if (x != null && x.abs() > 0) {
        // Tapped on a queen
        selected = i == selected ? null : i;
      } else if (selected != null) {
        // Move queen
        widget.cells[i] = widget.cells[selected];
        widget.cells[selected] = null;
        selected = null;
      } else
        // place/delete arrow
        widget.cells[i] = widget.cells[i] == 0 ? null : 0;
    });
  }
  */

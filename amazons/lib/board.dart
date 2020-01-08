import 'package:flutter/material.dart';

import './colors.dart';
import './cell.dart';

class Board extends StatefulWidget {
  final List<int> cells;
  final int boardSize;
  int selected;
  int turn = 0; //0: white moves. 1: white places. 2: red moves. 3: red places
  Board(this.cells, this.boardSize);

  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  void _tapped(i) {
    if (widget.turn % 2 == 0 &&
        widget.cells[i] != null &&
        widget.cells[i].abs() > 0) {
      setState(() {
        widget.selected = widget.selected == i ? null : i;
      });
    }
  }

  void _tappedHL(i) {
    setState(() {
      if (widget.turn % 2 == 0) {
        widget.cells[i] = widget.cells[widget.selected];
        widget.cells[widget.selected] = null;
        widget.selected = i;
      } else {
        widget.cells[i] = 0;
        widget.selected = null;
      }
    });
    widget.turn = 1 - widget.turn;
  }

  @override
  Widget build(BuildContext context) {
    List<int> moves =
        _validMoves(widget.cells, widget.selected, widget.boardSize);
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: widget.boardSize,
      children: List.generate(
        widget.boardSize * widget.boardSize,
        (i) => moves.indexOf(i) == -1
            ? Cell(i, colorElem(widget.cells[i], i == widget.selected),
                colorCell(i, widget.boardSize), _tapped)
            : HighlightedCell(i, colorCell(i, widget.boardSize), _tappedHL),
      ),
    );
  }
}

// Ugly unavoidable code...
List<int> _coords(int i, int size) {
  return [i % size, (i / size).floor()];
}

int _toid(int x, int y, int size) {
  return y * size + x;
}

List<int> _validMoves(List<int> cells, int selected, int size) {
  List<int> hl = [];
  if (selected != null) {
    List<int> c = _coords(selected, size);

    int i = c[0] - 1;
    //left
    while (i >= 0 && cells[_toid(i, c[1], size)] == null) {
      hl.add(_toid(i, c[1], size));
      i -= 1;
    }
    i = c[0] + 1;
    //right
    while (i < size && cells[_toid(i, c[1], size)] == null) {
      hl.add(_toid(i, c[1], size));
      i += 1;
    }
    //up
    i = c[1] - 1;
    while (i >= 0 && cells[_toid(c[0], i, size)] == null) {
      hl.add(_toid(c[0], i, size));
      i -= 1;
    }
    i = c[1] + 1;
    //down
    while (i < size && cells[_toid(c[0], i, size)] == null) {
      hl.add(_toid(c[0], i, size));
      i += 1;
    }
    //ul
    i = 1;
    while (c[0] - i >= 0 &&
        c[1] - i >= 0 &&
        cells[_toid(c[0] - i, c[1] - i, size)] == null) {
      hl.add(_toid(c[0] - i, c[1] - i, size));
      i += 1;
    }
    //ur
    i = 1;
    while (c[0] + i < size &&
        c[1] - i >= 0 &&
        cells[_toid(c[0] + i, c[1] - i, size)] == null) {
      hl.add(_toid(c[0] + i, c[1] - i, size));
      i += 1;
    }
    //dl
    i = 1;
    while (c[0] - i >= 0 &&
        c[1] + i < size &&
        cells[_toid(c[0] - i, c[1] + i, size)] == null) {
      hl.add(_toid(c[0] - i, c[1] + i, size));
      i += 1;
    }
    //dr
    i = 1;
    while (c[0] + i < size &&
        c[1] + i < size &&
        cells[_toid(c[0] + i, c[1] + i, size)] == null) {
      hl.add(_toid(c[0] + i, c[1] + i, size));
      i += 1;
    }
  }
  return hl;
}

import 'dart:math' show min;
import 'package:flutter/material.dart';

import './board.dart';

int board = 0;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Game of the Amazons"),
        ),
        body: new Layout(),
      ),
    );
  }
}

class Layout extends StatefulWidget {
  List<Board> boards = [
    Board(init(6), 6),
    Board(init(8), 8),
    Board(init(10), 10)
  ];
  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double screenSize = min(constraints.maxHeight, constraints.maxWidth);
      List<Widget> layout = [
        Container(
          height: screenSize,
          width: screenSize,
          child: widget.boards[board],
        ),
        RaisedButton(
          onPressed: () {
            setState(() {
              board = (board + 1) % 3;
              build(context);
            });
          },
          child: Text('Reset/Change size'),
        ),
      ];
      return MediaQuery.of(context).orientation == Orientation.landscape
          ? Row(
              children: layout,
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: layout,
            );
    });
  }
}

List<int> init(int boardSize) {
  //print('called init with $boardSize');
  List<int> cells = List.generate(boardSize * boardSize, (i) => null);
  List<int> t1;
  List<int> t2;
  if (boardSize == 6) {
    t1 = [3, 12];
    t2 = [23, 32];
  } else if (boardSize == 8) {
    t1 = [3, 16, 23];
    t2 = [40, 47, 60];
  } else if (boardSize == 10) {
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

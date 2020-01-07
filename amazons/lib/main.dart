import 'dart:math' show min;
import 'package:flutter/material.dart';

import './board.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Game of the Amazons"),
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          boardSize = min(constraints.maxHeight, constraints.maxWidth);
          print('board size updated!');
          print(boardSize);
          //boardSize = min(MediaQuery.of(context).size.height.floor(),
          //        MediaQuery.of(context).size.width.floor())
          //    .toDouble();
          List<Widget> layout = [
            Container(height: boardSize, width: boardSize, child: new Board()),
            RaisedButton(
              onPressed: () {},
            ),
          ];
          return MediaQuery.of(context).orientation == Orientation.landscape
              ? Row(
                  children: layout,
                )
              : Column(
                  children: layout,
                );
        }),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {},
        //   child: Icon(Icons.add),
        // ),
      ),
    );
  }
}

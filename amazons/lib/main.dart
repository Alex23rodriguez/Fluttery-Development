import 'dart:math' show min;
import 'package:flutter/material.dart';

import './board.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    boardSize = min(MediaQuery.of(context).size.height.floor(),
        MediaQuery.of(context).size.width.floor());
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Game of the Amazons"),
        ),
        body: Column(
          children: <Widget>[
            LayoutBuilder(builder: (context, constraints) {
              return Container(
                  height: constraints.maxHeight < constraints.maxWidth
                      ? constraints.maxHeight
                      : constraints.maxWidth,
                  width: constraints.maxHeight < constraints.maxWidth
                      ? constraints.maxHeight
                      : constraints.maxWidth,
                  child: new Board());
            }),
            RaisedButton(
              onPressed: () {},
            )
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {},
        //   child: Icon(Icons.add),
        // ),
      ),
    );
  }
}

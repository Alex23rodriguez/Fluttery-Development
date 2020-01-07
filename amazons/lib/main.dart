import 'dart:math' show min;
import 'package:flutter/material.dart';

import './board.dart';

double screenSize;

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
          screenSize = min(constraints.maxHeight, constraints.maxWidth);
          List<Widget> layout = [
            Container(
                height: screenSize, width: screenSize, child: new Board()),
            //RaisedButton(
            //  onPressed: () {},
            //),
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

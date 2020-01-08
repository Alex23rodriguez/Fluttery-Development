import 'package:flutter/material.dart';

import './queen.dart';
import './arrow.dart';

class Cell extends StatelessWidget {
  final int id;
  final Color cElem;
  final Color cCell;
  final Function callback;

  Cell(this.id, this.cElem, this.cCell, this.callback);

  get _child {
    if (cElem == null) {
      return null;
    }
    if (cElem == Colors.black) {
      return Arrow();
    }
    return Queen(cElem);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => callback(id),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: cCell,
        ),
        child: _child,
      ),
    );
  }
}

class HighlightedCell extends StatelessWidget {
  final int id;
  final Color c;
  final Function callback;

  HighlightedCell(this.id, this.c, this.callback);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => callback(id),
      child: Container(
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: c,
        ),
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        ),
      ),
    );
  }
}

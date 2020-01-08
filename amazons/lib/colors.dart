import 'package:flutter/material.dart' show Colors, Color;

Color colorElem(int c, bool accent) {
  //Color palette function
  if (accent) {
    c *= 2;
  }
  Color x;
  switch (c) {
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

Color colorCell(int i, int size) {
  return (i % size + (i / size).floor()) % 2 == 0 ? Colors.green : Colors.white;
}

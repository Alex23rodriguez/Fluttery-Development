import 'package:flutter/material.dart';

class Arrow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        margin: EdgeInsets.all(constraints.maxHeight * 0.2),
        child: CircleAvatar(
          backgroundColor: Colors.black,
        ),
      );
    });
  }
}

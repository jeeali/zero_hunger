import 'package:flutter/material.dart';

class DrawCircle extends StatelessWidget {
  final Color color;

  const DrawCircle({Key key, @required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12.0,
      height: 12.0,
      margin: EdgeInsets.all(4),
      decoration: new BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

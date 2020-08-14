import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      alignment: Alignment.center,
      height: 300,
      width: 300,
      child: Text(
        "Screen 4",
        style: TextStyle(color: Colors.white, fontSize: 30),
      ),
      color: Colors.amber,
    ));
  }
}

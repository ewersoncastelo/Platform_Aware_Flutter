import 'package:flutter/material.dart';

class FancyButton extends StatelessWidget {
  FancyButton({@required this.onPressed});

  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Colors.deepOrange,
      splashColor: Colors.orange,
      padding: EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 20.0,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.explore,
            color: Colors.amber,
          ),
          SizedBox(
            width: 8.0,
          ),
          Text(
            "My Button",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
      onPressed: onPressed,
      shape: const StadiumBorder(),
    );
  }
}

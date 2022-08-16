import 'package:flutter/material.dart';
import 'package:to_doist/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color color;
  RoundedButton(
      {required this.text, required this.color, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      color: color,
      borderRadius: BorderRadius.circular(10),
      child: MaterialButton(
        onPressed: onPressed,
        minWidth: 200,
        height: 40,
        child: Text(
          text,
          style: kTextStyle,
        ),
      ),
    );
  }
}

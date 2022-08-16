import 'package:flutter/material.dart';
import 'package:to_doist/constants.dart';

class OutlineButtonWidget extends StatelessWidget {
  final Function() onPressed;
  final String text;
  OutlineButtonWidget({required this.onPressed, required this.text});
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 45,
      minWidth: 200,
      child: OutlineButton(
        onPressed: onPressed,
        shape: StadiumBorder(),
        highlightElevation: 5,
        color: kActiveColor,
        borderSide: BorderSide(
          color: Colors.grey,
        ),
        child: Text(
          text,
          style: kTextStyle,
        ),
      ),
    );
  }
}

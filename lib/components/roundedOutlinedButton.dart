import 'package:flutter/material.dart';
import 'package:nearby_water_drink/constants.dart';

class RoundedOutlinedButton extends StatelessWidget {
  final Widget icon;
  final String text;
  final Function onPressed;
  RoundedOutlinedButton({this.icon, this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
  return ConstrainedBox(
    constraints: BoxConstraints.tightFor(width: 200),
    child: OutlinedButton.icon(
        icon:icon,
        label:Text(
          text,
          style: TextStyle(
            fontSize: 19,
            color: kMainColor
          ),
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            )
          )
        ),
        onPressed: onPressed,

      ),

    );
  }
}
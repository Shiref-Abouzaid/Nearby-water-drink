import 'package:flutter/material.dart';
import '/constants.dart';
class RoundedButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onPressed;
  RoundedButton({this.icon, this.text, this.onPressed});
  @override
  Widget build(BuildContext context) {

  return ConstrainedBox(
    constraints: BoxConstraints.tightFor(width: 200),
    child: ElevatedButton.icon(
        icon: Icon(icon,color: Colors.white,),
        label:Text(
          text,
          style: TextStyle(
            fontSize: 22,
            color:Colors.white
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(kMainColor),
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
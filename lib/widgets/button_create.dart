import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(this.onPressed);
  late final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 300.0,
      height: 40.0,
      color: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Theme.of(context).backgroundColor, width: 1),
      ),
      child: Text("CRÉER",
          style: TextStyle(
            fontFamily: "Raleway-Bold",
            fontSize: 13.0,
            color: Theme.of(context).backgroundColor,
          )),
      onPressed: onPressed,
    );
  }
}

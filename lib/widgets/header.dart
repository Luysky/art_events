import 'package:flutter/material.dart';

AppBar header(context, {bool isAppTitle = true, String titleText = "text"}) {
  return AppBar(
    title: Text(
      isAppTitle ? "Bienvenu!" : titleText,
      style: TextStyle(
        color: Colors.white,
        fontFamily: "Raleway-ExtraBold",
        fontSize: 50.0,
      ),
    ),
    centerTitle: true,
    backgroundColor: Theme.of(context).backgroundColor,
  );
}
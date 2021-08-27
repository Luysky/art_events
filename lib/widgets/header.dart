import 'package:flutter/material.dart';

AppBar header(context, {bool isAppTitle = false, String titleText = "text"}) {
  return AppBar(
    title: Align(alignment: Alignment.centerLeft,child: Text(
      
      isAppTitle ? titleText : 'ErrorAppBar',
      style: TextStyle(
        color: Theme.of(context).primaryColor,
        fontFamily: "Raleway-ExtraBold",
        fontSize: 50.0,
      ),
    ),
    ),
    centerTitle: true,
    backgroundColor: Theme.of(context).backgroundColor,
  );
  
}
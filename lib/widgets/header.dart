import 'package:flutter/material.dart';

AppBar header(context, {bool isAppTitle = true, String titleText = "text"}) {
  return AppBar(




    title: Align(alignment: Alignment.centerLeft,child: Text(
      
      isAppTitle ? titleText : 'ErrorAppBar',


      style: TextStyle(
        color: Theme.of(context).primaryColor,
        fontFamily: "Raleway-ExtraBold",
        fontSize: 30.0,
      ),
    ),
    ),
    centerTitle: true,
    backgroundColor: Theme.of(context).backgroundColor,


    /*Affichage du bouton de tri*/
    actions: <Widget>[
      if (titleText == 'Actualité')
        IconButton(
          padding: EdgeInsets.fromLTRB(0, 0, 40, 0),
          icon: Icon(

            Icons.filter_list,
            size: 30.0,
            color: Colors.white,
          ),
          onPressed: () {
          },
        )
    ],


    /*<Widget>[
      IconButton(
        padding: EdgeInsets.fromLTRB(0, 0, 40, 0),
        icon: Icon(

          Icons.filter_list,
          size: 30.0,
          color: Colors.white,
        ),
        onPressed: () {
        },
      )
    ]*/

  );
  
}


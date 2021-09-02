import 'package:flutter/material.dart';
/*import 'package:popup_menu/popup_menu.dart';*/

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
        PopupMenuButton(
            padding: EdgeInsets.only(right:40.0),
            icon: Icon(Icons.filter_list, color: Colors.white, size: 40.0,),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("Trier par date"),
                value: 1,
              ),
              PopupMenuItem(
                child: Text("Trier par nom"),
                value: 2,
              )
            ]
        )
    ],
  );
}



import 'package:flutter/material.dart';

/*
* Widget de l'app bar / header
* Définit le design pour toute l'app
*/
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

    //Affichage du bouton de tri
    actions: <Widget>[

      //Si on est sur la page actualité
      if (titleText == 'Actualité')
        //On affiche le bouton de tri
        PopupMenuButton(
          //Lorsqu'on sélectionne une façon de trier
          onSelected: (value) {
            //Passage de la valeur en paramètre, cette valeur détermine
            //Si on veut trier par date ou par nom (3=date, 4=nom)
            Navigator.pushNamed(
              context,
              '/eventslist_screen',
              arguments: value,
            );
          },
            padding: EdgeInsets.only(right:20.0),
          //Définit l'icon de tri
            icon: Icon(Icons.filter_list, color: Colors.white, size: 40.0,),

            itemBuilder: (context) => [
              //2 choix en appuyant sur l'icone de tri
              PopupMenuItem(child: Text('Trier par date'), value: 'date'),
              PopupMenuItem(child: Text('Trier par nom'), value: 'nameAsc'),             
            ],
        ),
      IconButton(
        onPressed: () => Navigator.pushNamed(context, '/about_screen'),
        icon: Icon(Icons.info_outline_rounded, color: Colors.white, size: 40.0, ),
      ) ,
    ],
  );
}



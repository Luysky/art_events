import 'package:art_events/service/authentificationService.dart';
import 'package:art_events/widgets/button_create.dart';
import 'package:art_events/widgets/header.dart';
import 'package:flutter/material.dart';

/*
* Classe qui gère le screen du profil + version app
* Reliée par le bouton info dans la navigation bar
*/
class AboutScreen extends StatefulWidget {
  static const routeName = '/about_screen';


  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<AboutScreen> {
  final AuthentificationService _auth = AuthentificationService();
  @override
  void initState() {
    super.initState();
  }

  makeLogout() async {
   await _auth.logOut();
   Navigator.of(context).pushNamed('/');
   print('Out');
  }

  contactHelpCenter(){
    // TODO : ici il faut ecrire la methode qui envoi un email
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: header(context, titleText: 'A propos'),
      body: ListView(
        padding: EdgeInsets.all(30),
        children: <Widget> [
          SizedBox(height: 20,),
          Text(
              'Vos informations',
            style: TextStyle(
              fontFamily: "Raleway-ExtraBold",
              fontSize: 30.0,
              color: Theme.of(context).backgroundColor,
            ),
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Text(
                'Adresse e-mail :  ',
                style: TextStyle(
                  fontFamily: "Raleway-Regular",
                  fontSize: 15.0,
                  color: Theme.of(context).backgroundColor,
                ),
              ),
              Text('ici il faut chercher ladresse de user'),
            ],
          ),
          Row(
            children: [
              Text(
                'Evenements :  ',
                style: TextStyle(
                  fontFamily: "Raleway-Regular",
                  fontSize: 15.0,
                  color: Theme.of(context).backgroundColor,
                ),
              ),
              Text('ici il faut chercher le list des evenements'),
            ],
          ),
          SizedBox(height: 120,),
          CustomButton(() => makeLogout(), 'Logout'),
          SizedBox(height: 30,),
          CustomButton(() => contactHelpCenter(), 'Contacter en cas de souci'),
          SizedBox(height: 50,),
          Text(
              'App - A voir',
              textAlign: TextAlign.center,
              style: TextStyle(
              fontFamily: "Raleway-Regular",
              fontSize: 15.0,
              color: Theme.of(context).backgroundColor,
            ),
          ),
          Text(
              'Version 1.0.3',
              textAlign: TextAlign.center,
              style: TextStyle(
              fontFamily: "Raleway-Regular",
              fontSize: 15.0,
              color: Theme.of(context).backgroundColor,
            ),),
        ],
      ),
    );
  }
}
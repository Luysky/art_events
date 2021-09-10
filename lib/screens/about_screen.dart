import 'package:art_events/models/modelUser.dart';
import 'package:art_events/service/authentificationService.dart';
import 'package:art_events/widgets/button_create.dart';
import 'package:art_events/widgets/header.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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

  contactHelpCenter() {
    launchEmail();
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
               //buildName(user!),
               ]

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
              Text('list des evenements'),
            ],
          ),
          SizedBox(height: 120,),
          CustomButton(() => makeLogout(), 'Déconnexion'),
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
            ),
          ),
        ],
      ),
    );
  }

    Widget buildName(ModelUser user) => Column(
        children: [
          const SizedBox(height: 4),
          Text(
            user.email!+"",
            style: TextStyle(color: Colors.grey),
          )
        ],
      );
    
    Future launchEmail({
      String toEmail = 'bretzlouise@gmail.com',
      String subject = 'Yoyo',
      String message = 'Yo le sang',
      }) async {
        final url = 'mailto:$toEmail?subject=$Uri.encodeFull(subject)}&body=${Uri.encodeFull(message)}' ;

        if(await canLaunch(url)){
          await launch(url);
        }
      }


}
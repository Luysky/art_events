import 'package:art_events/widgets/button_create.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isAuth = false;

  @override
  void initState() {
    super.initState();
  }

  Scaffold buildAuthScreen() {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        alignment: Alignment.center,
      ),
    );
  }

  createAccountScreen(BuildContext context) {
    Navigator.of(context).pushNamed('/create_account');
  }

  EventsListScreen(BuildContext context) {
    Navigator.of(context).pushNamed('/eventslist_screen');
  }

  Scaffold buildUnAuthScreen() {
    final mediaQuery = MediaQuery.of(context);
    var widthFav, heightFav;
    widthFav = mediaQuery.size.width;
    heightFav = mediaQuery.size.height;
    return Scaffold(
      body: Form(
        child: ListView(
          padding: EdgeInsets.all(50),
          children: <Widget>[
            Image.asset(
              'assets/images/logo_avoir_vf.png',
              width: 150,
              height: 200,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            Text(
              'Bienvenue !',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: "Raleway-ExtraBold",
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                color: Theme.of(context).backgroundColor,
              ),
            ),
            Text(
              'Entrez votre login',
              style: TextStyle(
                fontFamily: "Raleway-Regular",
                fontWeight: FontWeight.normal,
                fontSize: 15.0,
                color: Theme.of(context).backgroundColor,
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Adresse mail',
                labelStyle: TextStyle(
                  fontFamily: "Raleway-Regular",
                  fontSize: 14.0,
                  color: Theme.of(context).backgroundColor,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
              ),
              textInputAction: TextInputAction.next,
              cursorColor: Theme.of(context).backgroundColor,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Mot de passe',
                labelStyle: TextStyle(
                  fontFamily: "Raleway-Regular",
                  fontSize: 14.0,
                  color: Theme.of(context).backgroundColor,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
              ),
              textInputAction: TextInputAction.next,
              cursorColor: Theme.of(context).backgroundColor,
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              () => EventsListScreen(context),
              'LOGIN',
            ),
            CustomButton(
              () => createAccountScreen(context),
              "S'incrire",
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isAuth ? buildAuthScreen() : buildUnAuthScreen();
  }
}

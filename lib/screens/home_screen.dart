import 'package:art_events/widgets/button_create.dart';
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
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
              //width: widthFav,
              //height: heightFav,
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     fit: BoxFit.scaleDown,
              //     image: AssetImage('assets/images/logo_avoir_vf.png'),
              //   )
              // ),
              child: const Image(
                image: AssetImage('assets/images/logo_avoir_vf.png'),
              //   //width: 100,
              //   //height: 100,
               ),
            ),
            Container(
              child: Text(
                'Bienvenue!',
                style: TextStyle(
                  fontFamily: "Raleway-ExtraBold",
                  fontWeight: FontWeight.bold,
                  fontSize: 50.0,
                  color: Theme.of(context).backgroundColor,
                ),
              ),
            ),
            CustomButton(
              () => EventsListScreen(context),
              'LOGIN',
            ),
            CustomButton(
              () => createAccountScreen(context),
              'S' 'incrire',
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

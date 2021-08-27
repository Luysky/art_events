import 'package:art_events/screens/eventslist_screen.dart';
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

  Scaffold buildUnAuthScreen() {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            const Image(
              image: AssetImage('assets/images/logo_avoir_vf.png'),
            ),
            Text(
              'Bienvenue!',
              style: TextStyle(
                fontFamily: "Raleway-ExtraBold",
                fontSize: 50.0,
                color: Colors.red[900],
              ),
            ),

            ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => EventsListScreen()),
                );
              }, 
            child: Text('Allez vers Events'),
            ),
            CustomButton(()=> createAccountScreen(context)),

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

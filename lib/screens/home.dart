import 'package:art_events/screens/events_list.dart';
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
                  MaterialPageRoute(builder: (context) => eventListScreen()),
                );
              }, 
            child: Text('Allez vers Events'),
            )

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

import 'package:art_events/screens/events_list.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static const routeName = '/pages';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isAuth = false;
  PageController pageController = PageController();
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
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

  void goToEventsList(BuildContext context){
    Navigator.of(context).pushNamed('/events_list');
  }

  Scaffold buildUnAuthScreen() {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        alignment: Alignment.center,
        child: InkWell(
          onTap: () => goToEventsList(context),
          child: PageView(
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
              EventsList(),
            ],
          ),
        ),

      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isAuth ? buildAuthScreen() : buildUnAuthScreen();
  }
}

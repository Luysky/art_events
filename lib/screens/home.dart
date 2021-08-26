import 'package:art_events/screens/events_list.dart';
import 'package:art_events/widgets/button_create.dart';
import 'package:flutter/material.dart';

import 'create_account.dart';

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
        child: InkWell(
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
                  color: Theme.of(context).backgroundColor,
                ),
              ),
              MaterialButton(
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Theme.of(context).backgroundColor, width: 1)
                ),
                child: Text(
                  "ACTUALITÉ",
                  style: TextStyle(
                    fontFamily: "Raleway-Regular",
                    fontSize: 15.0,
                    color: Theme.of(context).backgroundColor,
                  )
                ),
                onPressed: () => goToEventsList(context),
              ),
              CustomButton( createAccountScreen(context),
              ),
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

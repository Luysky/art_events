
import 'package:art_events/widgets/header.dart';
import 'package:art_events/widgets/user_profile.dart';
import 'package:flutter/material.dart';

import '../dummy_users.dart';

class ScreenArguments {
  final String name;
  final String date;
  final String hour;
  final String place;
  final String image;

  ScreenArguments(this.name, this.date, this.hour, this.place, this.image);

  
}



// A Widget that extracts the necessary arguments from
// the ModalRoute.
class ExtractArgumentsScreen extends StatelessWidget {
  const ExtractArgumentsScreen({Key? key}) : super(key: key);

 


  static const routeName = '/extractArguments';


  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute
    // settings and cast them as ScreenArguments.
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    
    return Scaffold(
      appBar: header(context, titleText: "Détails"),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 300,
              child: Image.asset(
                args.image,
                height: 250,
                width: double.infinity,
                fit: BoxFit.none,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Text(
                args.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).backgroundColor,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.place,
                          color: Theme.of(context).backgroundColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          args.place,
                          style: TextStyle(
                            //fontSize: 10,
                            color: Theme.of(context).backgroundColor,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.calendar_today,
                          color: Theme.of(context).backgroundColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          args.date,
                          style: TextStyle(
                            //fontSize: 20,
                            color: Theme.of(context).backgroundColor,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.watch_later,
                          color: Theme.of(context).backgroundColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          args.hour,
                          style: TextStyle(
                            //fontSize: 20,
                            color: Theme.of(context).backgroundColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(
                        width: 1.0,
                        color: Colors.red,
                      ),
                      primary: Colors.white, // background
                      onPrimary: Colors.white, // foreground
                    ),
                    onPressed: () {
                      print('ok');
                      //A remplir
                    },
                    child: Text(
                      'Participants',
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).backgroundColor,
                      ),
                    ))),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 400,
              width: 300,
              child: ListView(
                children: DUMMY_USERS
                    .map((elData) => UserProf(elData.id, elData.username))
                    .toList(),
              ),
            ),
          ],
        ),
      )),
    );
  }
}


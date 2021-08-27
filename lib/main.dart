import 'package:art_events/screens/home_screen.dart';
import 'package:art_events/screens/event_details.dart';
import 'package:flutter/material.dart';
import 'package:art_events/widgets/event_item.dart';


void main() {
  runApp(
    MyArtEvents()
  );
}

class MyArtEvents extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Header',
      routes: {
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/eventDetails': (context) => const EventDetails(),
        ExtractArgumentsScreen.routeName: (context) =>
        const ExtractArgumentsScreen(),

      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xffFFF1F1),
        backgroundColor: Color(0xFFCC0022),
      ),
      home: Home(),
    );
// Comments
  }

}

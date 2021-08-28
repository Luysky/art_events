import 'package:art_events/screens/create_account.dart';
import 'package:art_events/screens/eventslist_screen.dart';
import 'package:art_events/screens/home_screen.dart';
import 'package:art_events/screens/event_details.dart';
import 'package:art_events/screens/profile.dart';
import 'package:flutter/material.dart';



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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xffFFF1F1),
        backgroundColor: Color(0xFFCC0022),
        scaffoldBackgroundColor: Color(0xffFFF1F1),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => Home(),
        '/eventslist_screen': (ctx) => EventsListScreen(),
        '/extractArguments': (ctx) => const ExtractArgumentsScreen(),
        '/create_account': (ctx) => CreateAccountScreen(), 
        '/profile' : (ctx) => ProfilScreen(),
      },
    );

  }

}

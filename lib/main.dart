import 'package:art_events/screens/create_account.dart';
import 'package:art_events/screens/events_list.dart';
import 'package:art_events/screens/create_account.dart';
import 'package:art_events/screens/home.dart';
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
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => Home(),
        '/events_list': (ctx) => EventsList(),
        '/create_account': (ctx) => CreateAccountScreen(),
      },
    );

  }

}


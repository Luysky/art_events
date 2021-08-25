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
        primaryColor: Colors.pink[50],
        backgroundColor: Colors.red[900],
      ),
      home: Home(),
    );

  }
}


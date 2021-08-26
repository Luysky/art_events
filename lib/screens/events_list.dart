
import 'package:flutter/material.dart';

class eventListScreen extends StatelessWidget {
  const eventListScreen({Key? key}) : super(key: key);

//TEST

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EventListScreen'),
        ),
    body: Center(
      child: Text(
        'Liste d''évènement',
      ),
    ),
    );
  }
}
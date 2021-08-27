
import 'package:art_events/widgets/event_item.dart';
import 'package:art_events/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:art_events/dummy_events.dart';
import 'package:art_events/screens/eventslist_screen.dart';

class EventDetails extends StatelessWidget {

  const EventDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.name;

    print(args);

    return Scaffold(
      appBar: AppBar(
        title: const Text('EventDetaiiils'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to the second screen when tapped.
          },
          child: const Text('Launch screen'),
        ),
      ),
    );
  }
}
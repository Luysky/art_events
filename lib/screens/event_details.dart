
import 'package:art_events/widgets/event_item.dart';
import 'package:art_events/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:art_events/dummy_events.dart';
import 'package:art_events/screens/eventslist_screen.dart';

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
      appBar: header(context, titleText: "Details"),
      body: Center(
      child: Column(
        children: [

          Container(
            child: Image.asset(
            args.image,
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          ),
          Container(
              child: Text(args.name)
          ),
          Container(
              child: Text(args.date)
          ),
          Container(
              child: Text(args.hour)
          ),
          Container(
              child :
              ElevatedButton(
                onPressed: (){
                  //A remplir
                },
                child: Text('Participate'),
              )
          ),
        ],
        )
      ),
    );
  }
}


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


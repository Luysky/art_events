
import 'package:art_events/widgets/header.dart';
import 'package:flutter/material.dart';


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
            height: 300,
            child: Image.asset(
            args.image,
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Text(args.name,
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
              child: Row(children: <Widget>[
                Icon(Icons.place,
                  color: Theme.of(context).backgroundColor,),
                SizedBox(width: 6,),
                Text(
                  args.place,
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).backgroundColor,
                  ),
                ),
              ],
              ),

          ),
          Container(
              padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
              child: Row(children: <Widget>[
                Icon(Icons.calendar_today,
                  color: Theme.of(context).backgroundColor,),
                SizedBox(width: 6,),
                Text(args.date,
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).backgroundColor,
                  ),
                )
              ],
              ),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
              child: Row(children: <Widget>[
                Icon(Icons.watch_later,
                  color: Theme.of(context).backgroundColor,),
                SizedBox(width: 6,),
                Text(args.hour,
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).backgroundColor,
                  ),
                )
              ],
              ),
          ),
          Container(
              child :
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      side:
                      BorderSide(width: 1.0, color: Colors.red,),
                        primary: Colors.white, // background
                        onPrimary: Colors.white, // foreground
                  ),
                onPressed: (){
                    print('ok');
                  //A remplir
                },
                child: Text('Participate',
                  style: TextStyle(
                    fontSize: 20,
                  color: Theme.of(context).backgroundColor,),
                )
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
        title: const Text('EventDetails'),
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


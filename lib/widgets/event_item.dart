import 'package:art_events/screens/event_details.dart';
import 'package:flutter/material.dart';
import 'package:art_events/screens/eventslist_screen.dart';


class EventItem extends StatelessWidget {
  final String name;
  final String date;
  final String hour;
  final String place;
  final String image;

  EventItem(
      {required this.name,
      required this.image,
      required this.date,
      required this.place,
      required this.hour});


  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
        Navigator.pushNamed(
            context,
            ExtractArgumentsScreen.routeName,
            arguments: ScreenArguments(
            name, date, hour, place, image
        ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.asset(
                  image,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 20,
                right: 10,
                child: Container(
                  width: 300,
                  color: Colors.black54,
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Text(
                    name,
                    style: TextStyle(fontSize: 26, color: Colors.white),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ],
            ),
            Padding(padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[               
                Row(children: <Widget>[
                  Icon(Icons.place,
                  color: Colors.red[900],),

                  SizedBox(width: 6,),
                  Text('$place',
                    style: TextStyle(
                    color: Colors.red[900],),),
                ],
                ),
                Row(children: <Widget>[
                  Icon(Icons.calendar_today,
                  color: Colors.red[900],),
                  SizedBox(width: 6,),
                  Text('$date',
                  style: TextStyle(
                  color: Colors.red[900],),),
                ],
                ),
              ],
            ),
            ),
          ],
        ),
      ),
    );
  }
}

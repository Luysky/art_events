import 'dart:io';
import 'package:art_events/models/event.dart';
import 'package:art_events/screens/event_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



/*
* Classe representant chaque évenement dans la liste d'event
*/
class EventItem extends StatelessWidget{

  final Event event;

  EventItem(this.event);

@override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          ExtractArgumentsScreen.routeName,
          arguments: ScreenArguments(event.id, event.name, event.date.toString().substring(0, 10), event.hour, event.place, event.image, event.participants),
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
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                Image.network(
                  event.image,
                  fit: BoxFit.fill,                 
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      event.name,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.place,
                        color: Theme.of(context).backgroundColor,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        '${event.place}',
                        style: TextStyle(
                          color: Theme.of(context).backgroundColor,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.calendar_today,
                        color: Theme.of(context).backgroundColor,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        '${event.date}'.substring(0,10),
                        style: TextStyle(
                          color: Theme.of(context).backgroundColor,
                        ),
                      ),
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
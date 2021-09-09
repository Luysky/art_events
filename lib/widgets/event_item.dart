import 'package:art_events/screens/event_details.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';



class EventItem extends StatelessWidget{
  // final String id;
  final DateTime date;
  final String hour;
  final String image;
  final String name;
  final String place;
  // final List<UserProf> participants;
  // final UserProf responsable;
    final String responsable;
   // final Uuid id;

  //final Uuid reference;



   /* const */ EventItem({
   // required this.id,
    required this.date,
    required this.hour,
    required this.image,
  required this.place,
    // required this.participants,
    // required this.responsable,
    required this.name,
    required this.responsable,
  //  required this.reference,
 // required this.id,

  });


  FirebaseFirestore firestore = FirebaseFirestore.instance;

EventItem.fromJson(Map<String, Object?> json)
      : this(
          name: json['name']! as String,
          date: json['date']! as DateTime,
          hour: json['hour']! as String,
          place: json['place']! as String,
          // participants: json['participants']! as List<UserProf>,
          responsable: json['responsable']! as String,
          image: json['image']! as String,
        //  reference: json['reference']! as Uuid,
      //    id: json['id'] as Uuid,
        );

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'date': date,
 //     'hour': hour,
      'place': place,
//      'participants': participants,
      // 'responsable': responsable,
  //     'image': image,
       'responsable': responsable,
    //   'id': id,
    };
  }


@override
  Widget build(BuildContext context) {
    // final mediaQuery = MediaQuery.of(context);
    // var widthFav, heightFav;
    // widthFav = mediaQuery.size.width;
    // heightFav = mediaQuery.size.height;
    return InkWell(
      onTap: () {
       
         Navigator.of(context).pushNamed(ExtractArgumentsScreen.routeName);
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
                CachedNetworkImage(
                 imageUrl: image,
                 fit: BoxFit.fill,
                 placeholder: (context, url) => Padding(
                   child: CircularProgressIndicator(),
                   padding: EdgeInsets.all(20.0),
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
                        '$place',
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
                        '$date'.substring(0,10),
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
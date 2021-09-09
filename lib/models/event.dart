import 'package:art_events/models/modelUser.dart';
import 'modelUser.dart';

class Event {
  final String idEvent;
  final String name;
  final String place;
  final String date;
  final String hour;
  //final List<modelUser> participants;
  //final modelUser responsable;
  final String image;

  const Event({

    required this.idEvent,
    required this.name,
    required this.place,
    required this.date,
    required this.hour,
   // required this.participants,
    //required this.responsable,
    required this.image,

  });
}

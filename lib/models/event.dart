import 'package:art_events/models/user.dart';
import 'user.dart';

class Event {

  final String id;
  final String	name;
  final String	place;
  final String date;
  final String hour;
  final List<User>	participants;
  final User	responsable;
  final String	image; 

  const Event({
    required this.id,
    required this.name,
    required this.place,
    required this.date,
    required this.hour,
    required this.participants,
    required this.responsable,
    required this.image,
});


}
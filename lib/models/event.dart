
import 'package:art_events/models/user.dart';
import 'package:art_events/models/user.dart';

import 'user.dart';

class Event {
  final String	name;
  final String	place;
  final DateTime	date;
  final List<User>	participants;
  final User	responsable;
  final String	image;

  Event({
    required this.name,
    required this.place,
    required this.date,
    required this.participants,
    required this.responsable,
    required this.image,
});

}
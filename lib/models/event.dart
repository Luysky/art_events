import 'package:art_events/models/user.dart';
import 'user.dart';

class Event {
  final String id;
  final String name;
  final String place;
  final String date;
  final String hour;
  final List<User> participants;
  final User responsable;
  final String image;

  const Event({
    this.id,
    this.name,
    this.place,
    this.date,
    this.hour,
    this.participants,
    this.responsable,
    this.image,
  });
}

import 'package:cloud_firestore/cloud_firestore.dart';


/*
* Classe modèle pour la gestion des évenements
*/
class Event {
  final DateTime date;
  final String hour;
  final String image;
  final String name;
  final String place;
  final String responsable;

 Event({
    required this.date,
    required this.hour,
    required this.image,
    required this.place,
    required this.name,
    required this.responsable,
  });


FirebaseFirestore firestore = FirebaseFirestore.instance;

Event.fromJson(Map<String, Object?> json)
      : this(
          name: json['name']! as String,
          date: json['date']! as DateTime,
          hour: json['hour']! as String,
          place: json['place']! as String,
          responsable: json['responsable']! as String,
          image: json['image']! as String,
        );

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'date': date,
      'place': place,
      'responsable': responsable,
    };
  }

final eventsRef =
    FirebaseFirestore.instance.collection('event').withConverter<Event>(
          fromFirestore: (snapshot, _) => Event.fromJson(snapshot.data()!),
          toFirestore: (Event, _) => Event.toJson(),
        );
}
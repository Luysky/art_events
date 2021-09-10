import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';


/*
* Classe modèle pour la gestion des évenements
*/
@immutable
class Event {
  late final String id;
  final DateTime date;
  final String hour;
  final String image;
  final String name;
  final String place;
  final List<dynamic> participants;
  final String responsable;

 Event({
    this.id = "-1",
    required this.date,
    required this.hour,
    required this.image,
    required this.place,
    required this.name,
    required this.participants,
    required this.responsable,

  });


FirebaseFirestore firestore = FirebaseFirestore.instance;

Event.fromJson(json)
      : this(
          id: json.id,
          name: json['name']! as String,
          date: json['date']! as DateTime,
          hour: json['hour']! as String,
          place: json['place']! as String,
          participants: json['participants']! as List<dynamic>,
          responsable: json['responsable']! as String,
          image: json['image']! as String,
        );

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'date': date,
      'place': place,
      'participants': participants,
      'responsable': responsable,
      //'id': id,
    };
  }

final eventsRef =
    FirebaseFirestore.instance.collection('event').withConverter<Event>(
          fromFirestore: (snapshot, _) => Event.fromJson(snapshot.data()!),
          toFirestore: (Event, _) => Event.toJson(),
        );
}
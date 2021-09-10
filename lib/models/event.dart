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
  final List<dynamic> participants;
  final String responsable;
  //final String uid;

 Event({
    required this.date,
    required this.hour,
    required this.image,
    required this.place,
    required this.name,
    required this.participants,
    required this.responsable,
   // required this.uid,
  });


FirebaseFirestore firestore = FirebaseFirestore.instance;

Event.fromJson(Map<String, Object?> json)
      : this(
          name: json['name']! as String,
          date: json['date']! as DateTime,
          hour: json['hour']! as String,
          place: json['place']! as String,
          participants: json['participants']! as List<dynamic>,
          responsable: json['responsable']! as String,
          image: json['image']! as String,
   //       uid: json['uid']! as String,
        );

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'date': date,
      'place': place,
      'participants': participants,
      // 'responsable': responsable,
       'image': image,
       'responsable': responsable,
  //     'id': uid,
    };
  }

final eventsRef =
    FirebaseFirestore.instance.collection('event').withConverter<Event>(
          fromFirestore: (snapshot, _) => Event.fromJson(snapshot.data()!),
          toFirestore: (Event, _) => Event.toJson(),
        );
}
import 'package:cloud_firestore/cloud_firestore.dart';


/*
* Classe modèle pour la gestion des évenements
*/
class Event {
  //final String id;
  final DateTime date;
  final String hour;
  final String image;
  final String name;
  final String place;
  final String responsable;
  //List participants;

 Event({
    //this.id = "-1",
    required this.date,
    required this.hour,
    required this.image,
    required this.place,
    required this.name,
    required this.responsable,
    //required this.participants


  });


FirebaseFirestore firestore = FirebaseFirestore.instance;

Event.fromJson(json)
      : this(
          //id: json.id,
          name: json['name']! as String,
          date: json['date']! as DateTime,
          hour: json['hour']! as String,
          place: json['place']! as String,
          responsable: json['responsable']! as String,
          image: json['image']! as String)
          /*participants:(json.data()['participants'] != null
          *? List.from(json.data()['participants'].toSet())
          : null) as List)*/;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'date': date,
      'place': place,
      //'participants': participants,
      //'responsable': responsable,
      // 'image': image,
       'responsable': responsable,
      // 'id': id,
      //'participants' : participants
    };
  }

final eventsRef =
    FirebaseFirestore.instance.collection('event').withConverter<Event>(
          fromFirestore: (snapshot, _) => Event.fromJson(snapshot.data()!),
          toFirestore: (Event, _) => Event.toJson(),
        );


/*
  removeParticipant(String userUid) async {
    participants.remove(userUid);
    await FirebaseFirestore.instance.collection("events").doc(id).update(toJson());
  }

  addParticipant(String userUid) async {
    participants.add(userUid);
    await FirebaseFirestore.instance.collection("events").doc(id).update(toJson());
  }*/
 }
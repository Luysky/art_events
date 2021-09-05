import 'dart:html';
import 'package:flutter/material.dart';
import 'package:art_events/models/user.dart';
import 'package:art_events/widgets/user_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:uuid/uuid.dart';
import 'user.dart';

/*
enum EventQuery {
  date,
  place,
  name,
}

extension on Query<Event> {
  /// Create a firebase query from a [MovieQuery]
   Query<Event> queryBy(EventQuery eventquery, String foo) {
    switch (eventquery) {
      case EventQuery.name:
        return where('name', arrayContainsAny: [foo]);

      case EventQuery.place:
        return where('place', arrayContainsAny: [foo]).orderBy('place', descending: true);

      case EventQuery.date:
        return orderBy('date', descending: true);

    }
  }
}
*/
class Event {
  // final String id;
  final String date;
//  final DateTime hour;
  final String image;
  final String name;
  final String place;
  // final List<UserProf> participants;
  // final UserProf responsable;
    final String responsable;

  //final Uuid reference;



   /* const */ Event({
   // required this.id,
    required this.date,
 //   required this.hour,
      required this.image,
  required this.place,
    // required this.participants,
    // required this.responsable,
    required this.name,
    required this.responsable,
  //  required this.reference,

  });


  FirebaseFirestore firestore = FirebaseFirestore.instance;

Event.fromJson(Map<String, Object?> json)
      : this(
          name: json['name']! as String,
          date: json['date']! as String,
         // hour: json['hour']! as DateTime,
          place: json['place']! as String,
          // participants: json['participants']! as List<UserProf>,
          responsable: json['responsable']! as String,
          image: json['image']! as String,
        //  reference: json['reference']! as Uuid,
        );

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'date': date,
 //     'hour': hour,
      'place': place,
//      'participants': participants,
      // 'responsable': responsable,
       'image': image,
       'responsable': responsable,
    };
  }

final eventsRef =
    FirebaseFirestore.instance.collection('event').withConverter<Event>(
          fromFirestore: (snapshot, _) => Event.fromJson(snapshot.data()!),
          toFirestore: (Event, _) => Event.toJson(),
        );


/*
}


class EventRepository {
  */
 /*
 DocumentReference reference;

factory Event.fromSnapshot(DocumentSnapshot snapshot) {
    Event newEmployee = Event.fromJson(snapshot.data());
    newEmployee.reference = snapshot.reference;
    return newEmployee;
  }

factory Event.fromJson(Map<String, dynamic> json) =>
      _employeeFromJson(json);

  List<Event> events = [];

  final CollectionReference collection =
      FirebaseFirestore.instance.collection('event');

  Stream<QuerySnapshot> getStream() {
    return collection.snapshots();
  }
*/
/*  Future<void> add(Event event) {
    var documentReference = eventsRef.add(event);
    return documentReference;
  }
  
 addUser() {
  return eventsRef
    // existing document in 'users' collection: "ABC123"
    .doc('ABC123')
    .set({/*
      'name': "Mary Jane",
      'date': 18 ...
      */},
      SetOptions(merge: true),
    )
    .then(
      (value) => print("name' & 'age' merged with existing data!")
    )
    .catchError((error) => print("Failed to merge data: $error"));
}


  delete(Event event) async {
    collection.doc(event.reference.toString()).delete();
  }
*/
  //fromSnapShot(DocumentSnapshot snapshot) => Event.fromJson(snapshot);

/*updateincomingTalks(
    List<QueryDocumentSnapshot<Map<String, dynamic>>> eventDocs) {
  //setState(() {
    var length = eventsRef.length.toString();
    if (eventDocs.length > 0) {
      eventDocs.map((element) {
        return (Event.fromJson(element.data()));
      }).toList();
    }
 // });
*/



  /* Future  buildEventList(AsyncSnapshot snapshot  , String filterKey ) 
    async *{ 
  //    List<QueryDocumentSnapshot> listQuery = await eventsRef.get().then((snapshot) => snapshot.docs);

      final events = /*await */ eventsRef.get();

      

  Event event;
    List<Event> list = [];
    List<Event> filteredList = [];

    for (final event in events.docs) {
        list.add(event.data());
      }

      return list;
      }
*/
    /// Based on the user snapShot, you can convert into the List and return to
    /// the futurebuilder
    ///
/*    await listQuery.map((list) {
        Event.fromJson(listQuery..data);
      }).toList();
      }
    /// 
    /// 
    // await listQuery.map((list) {
    //     Event(
    //       name: list['name'],
    //       date: list['date'],
    //        //cant do --> price: foodType1Data[index]['price'],
    //       image: list['image'], //cant do --> image: foodType1Data[index]['image'],
    //     );
    //   }).toList();
    //   }
*/
/*    await Future.forEach(listQuery, (doc) async {
      Map<String, dynamic> json = doc;
      list.add(Event.fromJson(doc.data ));
    }).then((value) {
      if (filterKey != null) {
        filteredList = list
            .where((element) =>
                //element.employeeID.toString() == filterKey ||
                element.name == filterKey ||
                element.date == filterKey ||
                element.hour == filterKey ||
                element.place == filterKey 
                //element.salary.toString() == filterKey
                )
            .toList();
      }
    });

  if (filteredList.isEmpty) {
      return Future<List<Event>>.value(list);
    } else {
      return Future<List<Event>>.value(filteredList);
    }
  }

*/

}
<<<<<<< HEAD
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
=======
import 'dart:io';
import 'package:art_events/screens/event_details.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:art_events/models/modelUser.dart';
import 'package:art_events/widgets/user_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'modelUser.dart';



class Event {
  // final String id;
  final Timestamp date;
  final String hour;
>>>>>>> develop
  final String image;
  final String name;
  final String place;
  // final modelUser responsable;
    final String responsable;
   // final Uuid id;


<<<<<<< HEAD
    required this.idEvent,
    required this.name,
    required this.place,
    required this.date,
    required this.hour,
   // required this.participants,
    //required this.responsable,
=======

   /* const */ Event({
   // required this.id,
    required this.date,
    required this.hour,
>>>>>>> develop
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

Event.fromJson(Map<String, Object?> json)
      : this(
          name: json['name']! as String,
          date: json['date']! as Timestamp,
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

final eventsRef =
    FirebaseFirestore.instance.collection('event').withConverter<Event>(
          fromFirestore: (snapshot, _) => Event.fromJson(snapshot.data()!),
          toFirestore: (Event, _) => Event.toJson(),
        );
}
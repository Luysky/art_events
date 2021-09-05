import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EventFirBz {
  final Timestamp date;
  final String image;
//  final String hour;
  final String name;
  final String place;
  final String responsable;


  const EventFirBz({
    required this.date,
    required this.image,
 //   required this.hour,
    required this.name,
    required this.place,
    required this.responsable,
  });
}
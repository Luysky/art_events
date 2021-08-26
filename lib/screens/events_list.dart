
import 'package:flutter/material.dart';

class EventsList extends StatefulWidget{

  static const routeName = '/events_list';
  @override
  _EventsListState createState() => _EventsListState();

}

class _EventsListState extends State<EventsList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(context){
    return Center(child: Text('Actualité'));
  }
}
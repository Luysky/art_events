
import 'package:art_events/widgets/event_item.dart';
import 'package:art_events/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:art_events/dummy_events.dart';

class EventsListScreen extends StatefulWidget{

  
  @override
  _EventsListState createState() => _EventsListState();

}

class _EventsListState extends State<EventsListScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(context){

    //Mettre les filtres ici
    //DUMMY_EVENTS.where...

    final eventList = DUMMY_EVENTS;
    return Scaffold(
      appBar: header(context, titleText: "Actualité"),
      body: ListView.builder(itemBuilder: (ctx,index){
        //return Text(eventList[index].name);
        return EventItem(name: eventList[index].name, 
        image: eventList[index].image, 
        date: eventList[index].date, 
        hour: eventList[index].hour,
        place: eventList[index].place,
        );
      }, itemCount: eventList.length,),
    );
  }
}
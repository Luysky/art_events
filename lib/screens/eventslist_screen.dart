
import 'package:art_events/models/event.dart';
import 'package:art_events/widgets/event_item.dart';
import 'package:art_events/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:art_events/dummy_events.dart';

import 'add_event.dart';

class EventsListScreen extends StatefulWidget{

  static const routeName = '/eventslist_screen';

  @override
  _EventsListState createState() => _EventsListState();

}

class _EventsListState extends State<EventsListScreen> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(context){

    //Crée la liste d'event avec DummyEvent
    var DUMMY_EVENTS;
    List<Event> eventList = DUMMY_EVENTS.toList();

    //Récupère la donnée valueSort définit dans la page "header"
    final valueSort = ModalRoute.of(context)?.settings.arguments;

    //Converstion en string de l'objet valeur
  /*  Map toJson() => {
      'valueSort': valueSort,
    };
*/
    //On trie par nom
    if(valueSort == '4')
    {
      eventList.sort((a,b) => a.name.compareTo(b.name));
    }

    //On trie par date
    if(valueSort == '3')
    {
      eventList.sort((a,b) => a.date.compareTo(b.date));
    }

    addEventScreen(BuildContext context){
      Navigator.of(context).pushNamed('/add_event');
    }

    return Scaffold(
      appBar: header(context, titleText: 'Actualité', ),
      body: ListView.builder(itemBuilder: (ctx,index,)
      {
        return EventItem(
          name: eventList[index].name,
          image: eventList[index].image,
          date: eventList[index].date,
          hour: eventList[index].hour,
          place: eventList[index].place,
        );
      }, itemCount: eventList.length,),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addEventScreen(context),
        child: const Icon(Icons.add),
        backgroundColor: Theme.of(context).backgroundColor,
    ),
    );
  }
}
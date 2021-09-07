
import 'package:art_events/models/EventFirBz.dart';
import 'package:art_events/models/event.dart';
import 'package:art_events/widgets/event_item.dart';
import 'package:art_events/widgets/header.dart';
import 'package:art_events/widgets/progress.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:art_events/dummy_events.dart';

import 'add_event.dart';

final eventsRef = FirebaseFirestore.instance.collection('event');

class EventsListScreen extends StatefulWidget{

  // static const routeName = '/eventslist_screen';

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

    //final eventsRef = FirebaseFirestore.instance.collection('event');
     List<Event> eventsList;

    //Crée la liste d'event avec DummyEvent
    List<EventItem> eventList = DUMMY_EVENTS.toList();

    //Récupère la donnée valueSort définit dans la page "header"
    final valueSort = ModalRoute.of(context)?.settings.arguments;

    //Converstion en string de l'objet valeur
  /*  Map toJson() => {
      'valueSort': valueSort,
    };
*/
  //   //On trie par nom
  //   if(valueSort == '4' || valueSort == 'name')
  //   {
  //    EventQuery.alphabAsc;
  // //    eventList.sort((a,b) => a.name.compareTo(b.name));
  //   }

  //   //On trie par date
  //   if(valueSort == '3' || valueSort == 'name')
  //   {
  //     EventQuery.date;
  //     //eventList.sort((a,b) => a.date.compareTo(b.date));
  //   }

    addEventScreen(BuildContext context){
      Navigator.of(context).pushNamed('/add_event');
    }

    return Scaffold(
      appBar: header(context, titleText: 'Actualité', ),
      body: StreamBuilder<QuerySnapshot>(
        stream: eventsRef.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }
          if (snapshot.data == null) {
            return circularProgress();
          } 
    addEventScreen(BuildContext context){
      Navigator.of(context).pushNamed('/add_event');
    }
    
          eventsList = snapshot.data!.docs              
              .map((doc) => 
              Event(date: doc['date'], hour:"ICI sera l'HEURE", image:  doc['image'],  name: doc['name'], place: doc['place'], responsable: doc['responsable']))
              .toList();
    if(valueSort == 'nameAsc')
    {
  //    eventList.sort((a,b) => a.name.compareTo(b.name));
     eventsList.sort((a,b) => a.name.compareTo(b.name));
    }

    //On trie par date
    if(valueSort == 'date')
    {
      eventsList.sort((a,b) => a.date.compareTo(b.date));
      //eventList.sort((a,b) => a.date.compareTo(b.date));
    }

          return Container(
            child: ListView.builder(itemBuilder: (ctx,index,)
            {
              return Event(
                name: eventsList[index].name,
                image: eventsList[index].image,
                date: eventsList[index].date,
                hour: eventList[index].hour,
                place: eventsList[index].place,
                responsable: eventsList[index].responsable,
              );
            }, itemCount: eventList.length,),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addEventScreen(context),
        child: const Icon(Icons.add),
        backgroundColor: Theme.of(context).backgroundColor,
    ),
    );
  }
}
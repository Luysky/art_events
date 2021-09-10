
import 'package:art_events/models/event.dart';
import 'package:art_events/models/modelUser.dart';
import 'package:art_events/screens/event_details.dart';
import 'package:art_events/widgets/event_item.dart';
import 'package:art_events/widgets/header.dart';
import 'package:art_events/widgets/progress.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:art_events/dummy_events.dart';
import 'package:uuid/uuid.dart';

import 'add_event.dart';

final eventsRef = FirebaseFirestore.instance.collection('event')
      .withConverter<Event>(
      fromFirestore: (snapshots, _) => Event.fromJson(snapshots.data()!),
      toFirestore: (event, _) => event.toJson(),
    );  

enum EventQuery {
  date,
  nameAsc,
}

extension on Query<Event> {
  /// Create a firebase query from a [MovieQuery]
   Query<Event> queryBy(EventQuery eventquery) {
    switch (eventquery) {

      case EventQuery.date:
        return orderBy('date', descending: false);

      case EventQuery.nameAsc:
        return orderBy('name'.toUpperCase(), descending: false);

    }
  }
}

class EventsListScreen extends StatefulWidget{
  const EventsListScreen({Key? key}) : super(key: key);
   static const routeName = '/eventslist_screen';

  @override
  _EventsListState createState() => _EventsListState();

}

class _EventsListState extends State<EventsListScreen> {
     Query<Event> query = eventsRef.queryBy(EventQuery.date);

  @override
  initState() {
    super.initState();
  }


  @override
  Widget build(context){

     List<Event> eventsList;

    //Récupère la donnée valueSort définit dans la page "header"
    final valueSort = ModalRoute.of(context)?.settings.arguments;

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
        
        Event(date: DateTime.parse(doc['date'].toDate().toString()),
              hour: doc['hour'].toString(), 
              image:  doc['image'],  name: doc['name'], 
              place: doc['place'], participants: doc['participants'], 
              responsable: doc['responsable'],
              /* id: doc['Uuid']*/))
        .toList();
  
      /**** List sort  ****/
      if(valueSort == 'nameAsc')
        {
          // 'name' sort
          query = eventsRef.queryBy(EventQuery.nameAsc);
        }
          // 'date' sort
      if(valueSort == 'date')
        {
          query = eventsRef.queryBy(EventQuery.date);
        }

          return Container(
            child: ListView.builder(itemBuilder: (ctx,index,)
            {
              return EventItem(
                name: eventsList[index].name,
                image: eventsList[index].image,
                date: eventsList[index].date,
                hour: eventsList[index].hour,
                place: eventsList[index].place,
                participants: eventsList[index].participants,                
                responsable: eventsList[index].responsable,
              );
            }, itemCount: eventsList.length,),
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
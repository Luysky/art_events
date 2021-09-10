
import 'package:art_events/models/event.dart';
import 'package:art_events/widgets/event_item.dart';
import 'package:art_events/widgets/header.dart';
import 'package:art_events/widgets/progress.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


final eventsRef = FirebaseFirestore.instance.collection('event')
      .withConverter<Event>(
      fromFirestore: (snapshots, _) => Event.fromJson(snapshots.data()!),
      toFirestore: (event, _) => event.toJson(),
    );


enum EventQuery {
  date,
  // place,
  // name,
  nameAsc,
}

extension on Query<Event> {
  /// Create a firebase query from a [MovieQuery]
   Query<Event> queryBy(EventQuery eventquery, String wanted) {
    switch (eventquery) {
      // case EventQuery.name:
      //   return where('name', arrayContainsAny: [wanted]);

      // case EventQuery.place:
      //   return where('place', arrayContainsAny: [wanted]).orderBy('place', descending: true);

      case EventQuery.date:
        return orderBy('date', descending: true);

      case EventQuery.nameAsc:
        return orderBy('name');

    }
  }
}

/*
* Classe pour l'écran de la liste des évenements
*/
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

     List<Event> eventsList;

    //Crée la liste d'event avec DummyEvent
    // List<EventItem> eventList = DUMMY_EVENTS.toList();

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
              Event(
                date: DateTime.parse(doc['date'].toDate().toString())   ,
                hour: doc['hour'].toString(),// doc['date'], hour: doc['hour'],
                    image:  doc['image'],  name: doc['name'], 
                    place: doc['place'], responsable: doc['responsable'],
                    /* id: doc['Uuid']*/))
              .toList();
    if(valueSort == 'nameAsc')
    {
     eventsList.sort((a,b) => a.name.compareTo(b.name));
    }

    //On trie par date
    if(valueSort == 'date')
    {
      eventsList.sort((a,b) => a.date.compareTo(b.date));
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
                responsable: eventsList[index].responsable,
                // participants // faut récuperer 
                //id: eventsList[index].id,
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
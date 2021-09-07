import 'package:art_events/models/EventFirBz.dart';
import 'package:art_events/models/event.dart';
import 'package:art_events/widgets/event_item.dart';
import 'package:art_events/widgets/header.dart';
import 'package:art_events/widgets/progress.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:art_events/dummy_events.dart';
import 'add_event.dart';

final eventsRef = FirebaseFirestore.instance.collection('event')
      .withConverter<Event>(
      fromFirestore: (snapshots, _) => Event.fromJson(snapshots.data()!),
      toFirestore: (movie, _) => movie.toJson(),
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



class EventslistFireBz extends StatefulWidget{
  const EventslistFireBz({Key? key}) : super(key: key);
  static const routeName = '/eventslist_screen';

  @override
  _EventsListState createState() => _EventsListState();

}

class _EventsListState extends State<EventslistFireBz> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(context){
      final wanted = "";

    //final eventsRef = FirebaseFirestore.instance.collection('event');
     List<Event> eventsList;
    EventQuery query = EventQuery.date;

    //Crée la liste d'event avec DummyEvent
    List<EventItem> eventList = DUMMY_EVENTS.toList();
    
    //Récupère la donnée valueSort définit dans la page "header"
    final valueSort = ModalRoute.of(context)?.settings.arguments;

    addEventScreen (BuildContext context){
      Navigator.of(context).pushNamed('/add_event');
    }

    return Scaffold(
         //// Début Modif 1 >>>>>>> OK   /////////////
      appBar: AppBar( 
        title: Column(
          children: [Text('Actualité'),], 
        ),
        actions: <Widget>[
          PopupMenuButton<EventQuery>(
            onSelected: (value) => setState(() => query = value),
            icon: const Icon(Icons.sort),
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  value: EventQuery.nameAsc,
                  child: Text('Sort by name'),
                ),
                const PopupMenuItem(
                  value: EventQuery.date,
                  child: Text('Sort by date'),
                ),
            /*    const PopupMenuItem(
                  value: EventQuery.place,
                  child: Text('Search by place'),
                ),
                const PopupMenuItem(
                  value: EventQuery.likesDesc,
                  child: Text('Search by name'),
                ),
            */  ];
            },
          ),
        ],
        //// Fin Modif 1 /////////////
      ),

               //// Début Modif 2 /////////////

      body: StreamBuilder<QuerySnapshot<Event>>(
        stream: eventsRef.queryBy(query,wanted).snapshots(),
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
              Event(date: doc['date'], hour:"ICI sera l'HEURE", image:  doc['image'], name: doc['name'], place: doc['place'], responsable: doc['responsable']))
              .toList();

    if(valueSort == 'nameAsc')
    {
      // on trie par nom ascendant
      EventQuery.nameAsc;
  //    eventList.sort((a,b) => a.name.compareTo(b.name));
  //   eventsList.sort((a,b) => a.name.compareTo(b.name));
    }

    //On trie par date
    if(valueSort == 'date')
    {
      EventQuery.date;
  //    eventsList.sort((a,b) => a.date.compareTo(b.date));
      //eventList.sort((a,b) => a.date.compareTo(b.date));
    }

          return Container(
            child: ListView.builder(itemBuilder: (ctx,index,)
            {
              return Event(
                name: eventsList[index].name,
                image: eventsList[index].image,
                date: eventsList[index].date,
                hour: eventsList[index].hour,
                place: eventsList[index].place,
                responsable: eventsList[index].responsable,
              );
            }, itemCount: eventList.length,),
          );
        },
      ),
              //// Fin Modif 2 /////////////

      floatingActionButton: FloatingActionButton(
        onPressed: () => addEventScreen(context),
        child: const Icon(Icons.add),
        backgroundColor: Theme.of(context).backgroundColor,
    ),
    );
  }
}

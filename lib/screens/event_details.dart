
import 'package:art_events/models/modelUser.dart';
import 'package:art_events/widgets/header.dart';
import 'package:art_events/widgets/progress.dart';
import 'package:art_events/widgets/user_profile.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';



FirebaseFirestore firestore = FirebaseFirestore.instance;

final usersRef = FirebaseFirestore.instance.collection('user')
    .withConverter<ModelUser>(
  fromFirestore: (snapshots, _) => ModelUser.fromJson(snapshots.data()!),
  toFirestore: (modelUser, _) => modelUser.toJson(),
);


class ScreenArguments {
  final String name;
  final String date;
  final String hour;
  final String place;
  final String image;
  final List<dynamic> participants;
 

  ScreenArguments(this.name, this.date, this.hour, this.place, this.image, this.participants);

//  final eventsRef = FirebaseFirestore.instance.collection('event');
//          Event targetEvent = await eventsRef.doc.where; 
}


 class ExtractArgumentsScreen extends StatefulWidget {
   // const ExtractArgumentsScreen({Key? key}) : super(key: key);
  static const routeName = '/extractArguments';

   @override
   _ExtractArgumentsState createState() => _ExtractArgumentsState();

 }

 class _ExtractArgumentsState extends State<ExtractArgumentsScreen> {

  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute
    // settings and cast them as ScreenArguments.
    final args = ModalRoute.of(context)?.settings.arguments as ScreenArguments;
    List<ModelUser> attendees = [];
    List<UserProf> participants = [];    
//Event targetEvent = eventsRef.doc.where; 

    return Scaffold(
      appBar: header(context, titleText: "Détails"),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: args.image,
              fit: BoxFit.fill,
              placeholder: (context, url) => Padding(
                child: CircularProgressIndicator(),
                padding: EdgeInsets.all(20.0),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Text(
                args.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).backgroundColor,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.place,
                          color: Theme.of(context).backgroundColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          args.place,
                          style: TextStyle(
                            //fontSize: 10,
                            color: Theme.of(context).backgroundColor,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.calendar_today,
                          color: Theme.of(context).backgroundColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          //args.date,
                          "${args.date}",
                          style: TextStyle(
                            //fontSize: 20,
                            color: Theme.of(context).backgroundColor,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.watch_later,
                          color: Theme.of(context).backgroundColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${args.hour}",
                          style: TextStyle(
                            //fontSize: 20,
                            color: Theme.of(context).backgroundColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(
                        width: 1.0,
                        color: Colors.red,
                      ),
                      primary: Colors.white, // background
                      onPrimary: Colors.white, // foreground
                    ),
                    onPressed: () {
                      print('ok');
                      //A remplir
                    },
                    /*** attendees list ***/
                    child: Text(
                      'Participants',
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).backgroundColor,
                      ),
                    ))),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 400,
              width: 300,
              child: Scaffold(
                body: StreamBuilder<QuerySnapshot>(
                  stream: usersRef.snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    

                    if (snapshot.data == null) {
                      return circularProgress();
                    }
                    
                    if (args.participants.length >0){
                      attendees = [];
                      participants = [];

                      args.participants.forEach((uuid) {               
                                        
                        for (var doc in snapshot.data!.docs) {
                          if(doc.reference.id == uuid){
                            attendees.add(ModelUser(username: doc['username'],
                                  email: doc['email'],
                                  isServiceProvider: doc['isServiceProvider'],
                                  listEvent: doc['listEvent'],),
                              );
                          };

                        };          
                      },);
                    };

                    attendees.forEach((element) {
                      participants.add(
                        UserProf(element));},);
                    
                    return Container(
                      child: ListView(
                        children: participants,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}


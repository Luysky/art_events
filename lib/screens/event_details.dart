
import 'package:art_events/models/modelUser.dart';
import 'package:art_events/widgets/header.dart';
import 'package:art_events/widgets/progress.dart';
import 'package:art_events/widgets/user_profile.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';


// Before  >> for us in this app
 //Firestore firestore = Firestore();
// Actual with higher dependencies' version
 FirebaseFirestore firestore = FirebaseFirestore.instance;

final eventsRef = FirebaseFirestore.instance.collection('user')
    .withConverter<ModelUser>(
  fromFirestore: (snapshots, _) => ModelUser.fromJson(snapshots.data()!),
  toFirestore: (event, _) => event.toJson(),
);


enum UserQuery {
  uid,
  username,

}

extension on Query<ModelUser> {
  /// Create a firebase query from a [MovieQuery]
  Query<ModelUser> queryBy(UserQuery userquery, String wanted) {
    switch (userquery) {

      case UserQuery.uid:
        return where(Uuid, isEqualTo: [wanted]);

      case UserQuery.username:
        return orderBy('username');

    }
  }
}


final usersRef = firestore.collection('user');


class ScreenArguments {
  final String name;
  final String date;
  final String hour;
  final String place;
  final String image;

 

  ScreenArguments(this.name, this.date, this.hour, this.place, this.image);

//  final eventsRef = FirebaseFirestore.instance.collection('event');
//          Event targetEvent = await eventsRef.doc.where; 
}


// A Widget that extracts the necessary arguments from
// the ModalRoute.
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
                      // return Text("no DATA here !!!");
                    }

                    final List<UserProf> children = snapshot.data!.docs
                        .map((doc) => UserProf(doc['username']))
                        .toList();
                    //final List<UserProf> children = snapshot.data!.docs
                      //  .map((doc) => UserProf(doc['id'], doc['username']))
                        //.toList();
                    return Container(
                      child: ListView(
                        children: children,
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


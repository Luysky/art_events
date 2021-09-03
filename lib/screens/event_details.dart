
import 'package:art_events/widgets/header.dart';
import 'package:art_events/widgets/progress.dart';
import 'package:art_events/widgets/user_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../dummy_users.dart';

// Before  >> for us in this app
 Firestore firestore = Firestore.instance;
// Actual with higher dependencies' version
 //FirebaseFirestore firestore = FirebaseFirestore.instance;



final usersRef = firestore.collection('user');

class ScreenArguments {
  final String name;
  final String date;
  final String hour;
  final String place;
  final String image;

  ScreenArguments(this.name, this.date, this.hour, this.place, this.image);

  
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
   void initState() {
     getUserById();
     super.initState();
   }

   getUserById() async {
     final String id = "tn5JSYircKOqEQldIr1A";
     final DocumentSnapshot doc = await usersRef.document(id).get();
     print(doc.data);
     print(doc.documentID);
     print(doc.exists);
   }



  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute
    // settings and cast them as ScreenArguments.
    final args = ModalRoute.of(context).settings.arguments as ScreenArguments;
    
    return Scaffold(
      appBar: header(context, titleText: "Détails"),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 300,
              child: Image.asset(
                args.image,
                height: 250,
                width: double.infinity,
                fit: BoxFit.none,
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
                          args.date,
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
                          args.hour,
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
                    final List<Text> children = snapshot.data.documents
                        .map((doc) => Text(doc['username']))
                        .toList();
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


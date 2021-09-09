import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class ModelUser {
  String id;
   String username;
   String? email;
   bool isServiceProvider;
   bool isSubscribed;
   List listEvent = [];

  ModelUser({
     this.id = "",
     this.username ="",
     this.email ="",
     this.isServiceProvider = false,
     this.isSubscribed = false,
     this.listEvent = const [],
  });




Map<String, Object?> toJson() {
  return {
    'username' : username,
    'email' : email,
    'isServiceProvider' : isServiceProvider,
    'isSubscribed' : isSubscribed,
    'listEvent': listEvent,
      };
  }

Future<void> populateFirestore() async {
    DocumentSnapshot<Map<String, dynamic>> snap =
        await FirebaseFirestore.instance.collection("user").doc(id).get();
    if (snap.exists) {
      username = (snap.data()!["username"] != null
          ? snap.data()!["username"] : "");
      email = (snap.data()!["email"] != null
          ? snap.data()!["email"] : "");
      isServiceProvider = (snap.data()!["isServiceProvider"] != null
          ? snap.data()!["isServiceProvider"]
          : false);
      isSubscribed = (snap.data()!["isSubscribed"] != null
          ? snap.data()!["isSubscribed"]
          : false);
      listEvent = (snap.data()!['listEvent'] != null
          ? List.from(snap.data()!['listEvent'].toSet())
          : []);
    }
  }

Future<void> save() async {
    await FirebaseFirestore.instance.collection("user").doc(id).set(toJson());
  }

  removeEventToUser(String eventId) async {
    listEvent.remove(eventId);
    save();
  }

  addEventToUser(String eventId) async {
    listEvent.add(eventId);
    save();
  }

  void setId(String id) {this.id = id;}
  void setEmail(String email) { this.email = email; }


    ModelUser.fromJson(Map<String, Object?> json)
        : this(
      username: json['username']! as String,
      email: json['email']! as String,
      listEvent: json['events']! as List<dynamic>,
      isServiceProvider: json['isServiceProvider']! as bool,
      isSubscribed: json['isSubscribed']! as bool,
      //  reference: json['reference']! as Uuid,
      id: json['id'] as String,
    );



}







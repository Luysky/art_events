import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import 'event.dart';

class ModelUser {
    late final String id;
   String username;
   String? email;
   bool isServiceProvider;
   bool isSubscribed;
   List listEvent = [];

  ModelUser({
     this.id ="",
     this.username ="",
     this.email ="",
     this.isServiceProvider = false,
     this.isSubscribed = false,
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
      username =
          (snap.data()!["username"] != null ? snap.data()!["username"] : "");
      email =
          (snap.data()!["email"] != null ? snap.data()!["email"] : "");
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

  removeEvent(String eventId) async {
    listEvent.remove(eventId);
    save();
  }

  addEvent(String eventId) async {
    listEvent.add(eventId);
    save();
  }

  void setId(String id) {this.id = id;}
  void setEmail(String email) { this.email = email; }


/*  User.fromJson(json)
    : this(
      id: json.id,
      username: (json.data()['username'] != null
      ? json.data()['username']
      : "emptyUsername") as String,
      email: (json.data()['email'] != null
      ? json.data()['email']
      : "emptyEmail") as String,
      isServiceProvider: (json.data()['isServiceProvider'] != null
      ? json.data()['isServiceProvider']
      : "emptyIsServiceProvider") as bool,
      isSubscribed: (json.data()['isSubscribed'] != null
      ? json.data()['isSubscribed']
      : "emptyIsSubscribed") as bool,
      password: (json.data()['password'] != null
      ? json.data()['password']
      : "emptyPassword") as String,);

Map<String, Object?> toJson() {
  return {
    'username' : username,
    'email' : email,
    'isServiceProvider' : isServiceProvider,
    'isSubscribed' : isSubscribed,
    'password' : password 
  };


@override
String toString() {
  return 'User{id: $id, email: $email, username: $username, password: $password, isServiceProvider: $isServiceProvider, isSubscribed: $isSubscribed}';
}


}


*/

}


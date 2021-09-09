import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import 'event.dart';

class User {
  final String username;
  final String email;
  final bool isServiceProvider;
  final bool isSubscribed;
  final Uuid id;

  User({
    required this.username,
    required this.email,
    required this.isServiceProvider,
    required this.isSubscribed,
    required this.id,
  });
  



  FirebaseFirestore firestore = FirebaseFirestore.instance;

User.fromJson(Map<String, Object?> json)
      : this(
          username: json['username']! as String,
          email: json['email']! as String,          
          // Evènement auxquels il participe: json['events']! as List<UserProf>,
          isServiceProvider: json['isServiceProvider']! as bool,
          isSubscribed: json['isSubscribed']! as bool,
        //  reference: json['reference']! as Uuid,
          id: json['id'] as Uuid,
        );

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
//      'participants': participants,
      'isServiceProvider': isServiceProvider,
      'isSubscribed': isSubscribed,
       'id': id,
    };
  }

final eventsRef =
    FirebaseFirestore.instance.collection('user').withConverter<User>(
          fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        );

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


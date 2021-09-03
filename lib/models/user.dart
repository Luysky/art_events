class User {
  final String id;
  final String username;
  final String email;
  final bool isServiceProvider;
  final bool isSubscribed;
  final String password;

  const User({
    required this.id,
    required this.username,
    required this.email,
    required this.isServiceProvider,
    required this.isSubscribed,
    required this.password,
  });
  
//   User.fromJson(json)
//     : this(
//       id: json.id,
//       username: (json.data()['username'] != null
//       ? json.data()['username']
//       : "emptyUsername") as String,
//       email: (json.data()['email'] != null
//       ? json.data()['email']
//       : "emptyEmail") as String,
//       isServiceProvider: (json.data()['isServiceProvider'] != null
//       ? json.data()['isServiceProvider']
//       : "emptyIsServiceProvider") as bool,
//       isSubscribed: (json.data()['isSubscribed'] != null
//       ? json.data()['isSubscribed']
//       : "emptyIsSubscribed") as bool,
//       password: (json.data()['password'] != null
//       ? json.data()['password']
//       : "emptyPassword") as String,);

// Map<String, Object?> toJson() {
//   return {
//     'username' : username,
//     'email' : email,
//     'isServiceProvider' : isServiceProvider,
//     'isSubscribed' : isSubscribed,
//     'password' : password 
//   };


// @override
// String toString() {
//   return 'User{id: $id, email: $email, username: $username, password: $password, isServiceProvider: $isServiceProvider, isSubscribed: $isSubscribed}';
// }


}







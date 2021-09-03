import 'event.dart';

class User {
  final String id;
  final String username;
  final String email;
  final bool isServiceProvider;
  final bool isSubscribed;
  final String password;

  const User({
    this.id,
    this.username,
    this.email,
    this.isServiceProvider,
    this.isSubscribed,
    this.password,
  });
}

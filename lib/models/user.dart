class User {
  final String username;
  final String email;
  final bool isServiceProvider;
  final bool isSubscribed;
  final String password;

  User({
    required this.username,
    required this.email,
    required this.isServiceProvider,
    required this.isSubscribed,
    required this.password,
  });
}

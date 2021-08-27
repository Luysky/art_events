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
}

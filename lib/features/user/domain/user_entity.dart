
class ENTUser {
  final String name;
  final String email;
  final String? avatar;

  ENTUser({
    required this.name,
    required this.email,
    this.avatar,
  });

  @override
  String toString() {
    return 'ENTUser(name: $name, email: $email, avatar: $avatar)';
  }
}
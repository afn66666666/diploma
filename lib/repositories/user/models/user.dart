class User {
  // final String id;
  final String name;
  final String surname;
  final String login;
  final String organization;
  final String role;

  const User(

      // {required this.id,
      {required this.name,
      required this.surname,
      required this.login,
      required this.organization,
      required this.role});

  factory User.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'name': String name,
        'surname': String surname,
        // 'id': int id.to,
        'login': String login,
        'organization': String organization,
        'role': String role,
      } =>
        User(
            // id: id,
            name: name,
            surname: surname,
            login: login,
            organization: organization,
            role: role),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}

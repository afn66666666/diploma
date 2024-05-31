class User {
  // final String id;
  final String name;
  final String surname;
  final String login;
  final String organizationId;
  final String roleId;

  const User(

      // {required this.id,
      {required this.name,
      required this.surname,
      required this.login,
      required this.organizationId,
      required this.roleId});

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
            organizationId: organization,
            roleId: role),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}

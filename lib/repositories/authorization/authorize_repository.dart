import 'dart:convert';

import 'package:flutter_application_2/repositories/user/models/user.dart';
import 'package:http/http.dart';

class AuthorizeRepository {

  Future<User> getUser(String login, String hash) async {
    final uri = Uri(
        scheme: 'https',
        host: 'vsuarcproject.ru',
        path: 'd_login',
        queryParameters: {'login': login, 'password': hash});

    final response = await get(uri);
    if (response.statusCode == 200) {
      final map = jsonDecode(response.body) as Map<String,dynamic>;
      final user = User.fromJson(map);
      return user;
    }
    else{
      throw Exception('status code != 200');
    }
  }
}

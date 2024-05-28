import 'dart:convert';
import 'dart:developer';

import 'package:crypto/crypto.dart';
import 'package:flutter_application_2/repositories/user/models/user.dart';
import 'package:http/http.dart';

class Authorizer {
  Future<bool> authorize(String login, String password) async {
    var hash = sha512.convert(utf8.encode(password)).toString();
    var uri = Uri(
        scheme: 'https',
        host: 'vsuarcproject.ru',
        path: 'd_login',
        queryParameters: {'login': login, 'password': hash});
    var response = await get(uri);
    if (response.statusCode == 200) {
      try {
        var responseMap = jsonDecode(response.body) as Map<String, dynamic>;
        var user = User.fromJson(responseMap);
        return true;
      } on FormatException catch (exc) {
        return false;
      }
    }
    return false;
  }
}

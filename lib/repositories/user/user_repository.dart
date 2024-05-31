import 'dart:convert';


import 'package:flutter_application_2/repositories/user/models/user.dart';
import 'package:http/http.dart';

class UserRepository {
  User user;
  String roleName = '';
  String orgName = '';
  UserRepository(this.user);

  User get getUser => user;

  Future<String> getOrganizationName() async {
    final uri = Uri(
        scheme: 'https',
        host: 'vsuarcproject.ru',
        path: 'd_get_org_name',
        queryParameters: {'id': user.organizationId});

    final response = await get(uri);
    if (response.statusCode == 200) {
      orgName = response.body;
      return response.body;
    }
    else{
      throw Exception('wrong status code: ${response.statusCode}');
    }
  }

  Future<String> getUserRoleName() async{
    final uri = Uri(
        scheme: 'https',
        host: 'vsuarcproject.ru',
        path: 'd_get_role_name',
        queryParameters: {'id': user.roleId});

    final response = await get(uri);
    if (response.statusCode == 200) {
      roleName = response.body;
      return response.body;
    }
    else{
      throw Exception('wrong status code: ${response.statusCode}');
    }
  }
}

import 'dart:convert';
import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:flutter_application_2/mcs_app.dart';
import 'package:flutter_application_2/repositories/cards_list/cards_list_repository.dart';
import 'package:flutter_application_2/repositories/authorization/authorize_repository.dart';
import 'package:get_it/get_it.dart';

void main() async {
  GetIt.I.registerSingleton(CardsListRepository());
  GetIt.I.registerSingleton(AuthorizeRepository());
   runApp(const MCSApp());
}

// connected значит получение информации о пользователе и только
// личный кабинет
// окошки ошибок (если не вернулся тру)
// поиск и фильтрация
// формулировка (что это???)
// эпохи

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/repositories/cards_list/models/card.dart';
import 'package:http/http.dart';

class CardsListRepository {
  Future<List<ArchCard>> getCards() async {
    List<ArchCard> result = [];
    final uri = Uri.parse('https://vsuarcproject.ru/d_load_new_cards');
    final response = await get(uri);
    if (response.statusCode == 200) {
      debugPrint(response.body);
      final test = jsonDecode(response.body) as List<dynamic>;
      int i = 0;
      for(var arr in test){
        final archCard = ArchCard.fromJson(arr);
        result.add(archCard);
        ++i;
      }

      int a = 1;
      return result;
    } else {
      throw Exception('status code != 200');
    }
  }
}

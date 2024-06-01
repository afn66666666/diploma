import 'dart:convert';
import 'dart:developer';

import 'package:flutter_application_2/features/defs.dart';
import 'package:flutter_application_2/repositories/cards_list/models/card.dart';
import 'package:http/http.dart';

class CardsListRepository {
    List<ArchCard> loadedCards = [];

  Future<List<ArchCard>> loadCards(int offset) async {

    if(offset == 150){
      return [];
    }

    final uri = Uri(
        scheme: 'https',
        host: 'vsuarcproject.ru',
        path: 'd_load_new_cards',
        queryParameters: {'offset': offset.toString()});
    final response = await get(uri);
    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        final test = jsonDecode(response.body) as List<dynamic>;
        int i = 0;
        for (var arr in test) {
          final archCard = ArchCard.fromJson(arr);
          loadedCards.add(archCard);
          ++i;
        }

        int a = 1;
        return loadedCards;
      } else {
        return [];
      }
    } else {
      throw Exception('status code != 200');
    }
  }

  Future<bool> insertCard(ArchCard card) async{
    await Future.delayed(defaultDbSimulationDelay,(){
      loadedCards.insert(0,card);
    });
    return true;
  }

}

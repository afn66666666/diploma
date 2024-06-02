


import 'dart:convert';
import 'dart:developer';

import 'package:flutter_application_2/repositories/excavations/models/excavation.dart';
import 'package:http/http.dart';

class ExcavationsRepository{
  Future<List<Excavation>> getExcavations() async{
    List<Excavation> excavations = [];
    final uri = Uri(
        scheme: 'https',
        host: 'vsuarcproject.ru',
        path: 'd_excavations',
        );
    final response = await get(uri);
    if (response.statusCode == 200) {
      final excavationsList = jsonDecode(response.body);
      for(final pair in excavationsList){
        final geodata = jsonDecode(pair['geodata']) ;
        final descr = geodata[0]['result'];
        final preparedData = <String,dynamic>{'id': pair['id'], 'description':descr,'geodata' : geodata[0]};
        excavations.add(Excavation.fromJson(preparedData));
      }
      return excavations;
    }
    else{
      throw Exception('wrong response status');
    }
  }
}
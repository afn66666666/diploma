import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/excavation_map/map_point.dart';
import 'package:flutter_application_2/features/excavation_map/map_screen.dart';
import 'package:flutter_application_2/features/defs.dart';
import 'package:flutter_application_2/repositories/cards_list/models/card.dart';
import 'package:flutter_application_2/repositories/excavations/models/excavation.dart';
import 'package:flutter_application_2/repositories/user/user_repository.dart';
import 'package:intl/intl.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class CardFormsRead extends StatelessWidget {
  final ArchCard _card;
  final mapControllerCompleter = Completer<YandexMapController>();
  CardFormsRead(this._card, {super.key}) {}

  @override
  Widget build(BuildContext context) {
    log('card form read builded');
    final theme = Theme.of(context);
    return Padding(
        padding: EdgeInsets.all(10),
        child: ListView(children: [
          Image.memory(
            _card.media,
            fit: BoxFit.contain,
          ),
          textData(labels[CardColumns.Name.index], _card.name, theme),
          textData(labels[CardColumns.Author.index], _card.author, theme),
          textData(labels[CardColumns.Date.index],
              DateFormat('yyyy-MM-dd').format(_card.date), theme),
          textData(labels[CardColumns.StoragePlace.index],
              'Археологический Музей Воронежского Университета', theme, true),
          textData(labels[CardColumns.Preservation.index], _card.preservation,
              theme, true),
          textData(
            labels[CardColumns.Size.index],
            _card.size,
            theme,
          ),
          textData(labels[CardColumns.ExcavationDate.index],
              DateFormat('yyyy-MM-dd').format(_card.excavationDate), theme),
          textData(labels[CardColumns.Description.index], _card.description,
              theme, true),
          textData(
            labels[CardColumns.RegistrationNumber.index],
            _card.registrationNumber.toString(),
            theme,
          ),
          const Text(
            'Место раскопок',
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.purple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0), // скругление углов
              ),
            ),
            onPressed: () {
              var json = (jsonDecode(_card.geodata) as List<dynamic>)[0];
              final name = json['result'];
              final latitude = double.parse(json['geo_lat']);
              final longtitude = double.parse(json['geo_lon']);
              Navigator.of(context).pushNamed('/object_excavation_map',arguments: MapPoint(name: name, latitude: latitude, longtitude: longtitude));
              // Navigator.of(context).pushReplacement<void, void>(
              //     MaterialPageRoute(builder: (context) {
              //   return MapScreen.single(point: MapPoint(name: name,latitude: latitude,longitude: longtitude),);
              // }
              // )
              // );
            },
            child: const Text(
              'Открыть карту',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 100,
          )
        ]));
  }

  Widget textData(String label, String data, ThemeData theme,
      [bool bigField = false]) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            label,
          ),
          TextFormField(
            maxLines: bigField ? null : 1,
            decoration: const InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide(width: 4)),
            ),
            style: const TextStyle(fontSize: 20),
            initialValue: data,
            readOnly: true,
          ),
        ]));
  }
}

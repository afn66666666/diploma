// import 'dart:async';

import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_application_2/card.dart';
import 'package:postgres/postgres.dart';
import 'package:flutter/material.dart';

class Connector with ChangeNotifier {
  Connector() {
    connect();
  }
  late Connection connection;
  late List<ArchCard> cards;

  bool _connected = false;
  bool get connected => _connected;

  void connect() async {
    connection =
        await Future<Connection>.delayed(const Duration(seconds: 4), () {
      return Connection.open(
        Endpoint(
          host: 'pg3.sweb.ru',
          database: 'avkuzbkru',
          username: 'avkuzbkru',
          password: 'Klizma000',
        ),
        settings: const ConnectionSettings(sslMode: SslMode.disable),
      );
    });

    if (connection.isOpen) {
      print("connected");
      _connected = true;
      var cardsRawData =
          await Future<Result>.delayed(const Duration(seconds: 3), () {
        print("get cards");
        return connection.execute("SELECT * FROM \"card_legacy\";");
      });
      cards = parseCardRawData(cardsRawData);
      notifyListeners();
    }
  }

  List<ArchCard> parseCardRawData(Result cardsRawData) {
    late List<ArchCard> result = [];
    var records = cardsRawData.asMap();
    for (int i = 0; i < records.length; ++i) {
      if (records.containsKey(i)) {
        var am = records[i]?.cast();
        var currentRecord = records[i]?.asMap();
        if (currentRecord != null) {
          // if (currentRecord.length != CardColumns.ColumnsAmount.index) {
          //   return result;
          // } else {
          int? id =
              int.tryParse(currentRecord[CardColumns.Id.index].toString());
          if (id == null) {
            continue;
          }
          print(id);
          String name = currentRecord[CardColumns.Name.index].toString();
          print(name);
          String usage = currentRecord[CardColumns.Usage.index].toString();
          String placement =
              currentRecord[CardColumns.Placement.index].toString();
          String period = currentRecord[CardColumns.Period.index].toString();
          String history = currentRecord[CardColumns.History.index].toString();
          String appearance =
              currentRecord[CardColumns.Appearance.index].toString();
          String author = currentRecord[CardColumns.Author.index].toString();
          String dataSource =
              currentRecord[CardColumns.DataSource.index].toString();
          Uint8List resources = base64Decode(
              currentRecord[CardColumns.Resources.index].toString());
          String creationDate =
              currentRecord[CardColumns.CreationDate.index].toString();
          String excavationYear =
              currentRecord[CardColumns.ExcavationYear.index].toString();
          String excavationDate =
              currentRecord[CardColumns.ExcavationDate.index].toString();
          // String storagePlace; //TODO: will be enum i guess...
          // int inventoryNumber;
          // String note;
          // List<Uint8> media;
          // String geodataLol;
          final newCard = ArchCard(
              id,
              name,
              usage,
              placement,
              period,
              history,
              appearance,
              author,
              dataSource,
              resources,
              creationDate,
              excavationYear,
              excavationDate);
          result.add(newCard);
          // }
        }
      }
    }
    return result;
  }
}

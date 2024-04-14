// import 'dart:async';

import 'dart:collection';
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_application_2/features/cards_list/models/card.dart';
import 'package:postgres/postgres.dart';
import 'package:flutter/material.dart';

class Connector with ChangeNotifier {
  Connector() {
    connect();
  }
  late Connection connection;
  HashMap<int, ArchCard> map = HashMap();

  bool _connected = false;
  bool get connected => _connected;

  void connect() async {
    try{
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
          await Future<Result>.delayed(const Duration(seconds: 1), () {
        print("get cards");
        return connection.execute("SELECT * FROM \"card_legacy\";");
      });
      map = parseCardRawData(cardsRawData);
      notifyListeners();
    }
    }
    on SocketException catch (exc){
      print('ERROR : socket exception');
    }
  }

  HashMap<int, ArchCard> parseCardRawData(Result cardsRawData) {
    var result = HashMap<int, ArchCard>();
    var records = cardsRawData.asMap();
    for (int i = 0; i < records.length; ++i) {
      if (records.containsKey(i)) {
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
          String usage = currentRecord[CardColumns.UsageNames.index].toString();
          String placement =
              currentRecord[CardColumns.Placement.index].toString();
          String period = currentRecord[CardColumns.Period.index].toString();
          String history = currentRecord[CardColumns.History.index].toString();
          String appearance =
              currentRecord[CardColumns.Appearance.index].toString();
          String author = currentRecord[CardColumns.Author.index].toString();
          String dataSource =
              currentRecord[CardColumns.DataSource.index].toString();
          // Uint8List resources = base64Decode(
          Uint8List resources = Uint8List(0);
          //     currentRecord[CardColumns.Resources.index].toString());
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
          result.putIfAbsent(id, () => newCard);
          // }
        }
      }
    }
    return result;
  }

  Future<bool> editCard(ArchCard card) async{
    var oldCard = map[card.id];
    if (oldCard == null) return false;
    // if (oldCard.isEqual(card)) return false;
    String query = editQueryStatement(card);
    var res = await connection.execute(query);
    print(res);
    return true;
  }


String editQueryStatement(ArchCard card){
  String id = 'id';
  String name = 'name';
  String usage = 'usage_names';
  String placement = 'placement';
  String period = 'period';
  String history = 'history';
  String appearance = 'appearance';
  String author = 'author';
  String dataSource = 'data_source';
  String resources = 'resources';
  String creationDate = 'creation_date';

  String res = '''UPDATE card_legacy SET
    $name = \'${card.name}\',$usage = \'${card.usageNames}\',$placement = \'${card.placement}\',$period = \'${card.period}\',
    $history = \'${card.history}\',$appearance = \'${card.appearance}\',$author = \'${card.author}\',
    $dataSource = \'${card.dataSource}\',$creationDate = \'${card.creationDate}\' WHERE id = \'${card.id}\';''';
    print(res);                           //$resources = \'${card.resources}\'
  return res;
} 

}


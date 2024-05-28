// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_application_2/features/defs.dart';



class ArchCard {
  String id;
  String name;
  DateTime date;
  String author;
  int infoYear;
  String infoSource;
  String receiveType; //TODO: will be enum
  String infoActNumber;
  DateTime excavationDate;
  String description;
  int count;
  String material; //TODO: will be enum
  String size;
  String preservation;
  int registrationNumber;
  String storagePlace; //TODO: will be enum i guess...
  String inventoryNumber;
  String note;
  Uint8List media;
  String geodata;

  ArchCard(
    this.id,
    this.name,
    this.date,
    this.author,
    this.infoYear,
    this.infoSource,
    this.receiveType,
    this.infoActNumber,
    this.excavationDate,
    this.description,
    this.count,
    this.material,
    this.size,
    this.preservation,
    this.registrationNumber,
    this.storagePlace,
    this.inventoryNumber,
    this.note,
    this.media,
    this.geodata
  );


ArchCard.fromJson(Map<String, dynamic> json):
  id = json['id'] as String,
  name = json['name'] as String,
  date = DateTime.parse(json['card_date'] as String),
  author = json['author'] ?? '',
  infoYear = json['information_year'] as int,
  infoSource = json['information_source'] as String,
  receiveType = json['information_receive_type'],
  infoActNumber = json['information_act_number'] as String,
  excavationDate = DateTime.parse(json['excavation_date']),
  description = json['description'] as String,
  count = json['count'] as int,
  material = json['material'] as String,
  size = json['size'] as String,
  preservation = json['preservation'] as String,
  registrationNumber = int.parse(json['registration_number']),
  storagePlace = json['storage_place'] as String,
  inventoryNumber = json['inventory_number'] as String,
  note = json['note'] ??'',
  // media = json['media']??'',
  media = base64Decode(json['media']),
  geodata = json['geodata'] as String;


  // factory ArchCard.fromJson(Map<String, dynamic> json) {
  //   return switch (json) {
  //     {
  //       'id': String userId,
  //       'card_date':  DateTime dateTime,
  //       'card_author': String author,
  //       'information_year': int infoYear,
  //       'information_source': String infoSource,
  //       'information_receive_type': String receiveType,
  //       'information_act_number': int infoActNumber,
  //       'excavation_date': DateTime excavationDate,
  //       'description': String description,
  //       'count': int count,
  //       'material': String materialId,
  //       'size': String size,
  //       'preservation': String preservation,
  //       'registration_number': int registrationNumber,
  //       'storage_place': String organizationId,
  //       'inventory_number': int inventoryNumber,
  //       'media': List<Uint8> media,
  //       'geodata': String geodata,
  //     } =>
  //       ArchCard(
  //         id: id,
  //         date: dateTime,
  //         infoYear: infoYear,
  //       ),
  //     _ => throw const FormatException('Failed to load album.'),
  //   };
  // }

  void setData(CardColumns column, Object data) {
    switch (column) {
      case CardColumns.Description:
        description = data.toString();
        break;
      case CardColumns.ExcavationDate:
        // excavationDate = data.toString();
        break;
      case CardColumns.Date:
        // date = data.toString();
        break;
      case CardColumns.Author:
        author = data.toString();
        break;
      case CardColumns.InfoYear:
        infoYear = int.parse(data.toString());
        break;
      case CardColumns.ReceiveType:
        receiveType = data.toString();
        break;
      case CardColumns.Size:
        size = data.toString();
        break;
      case CardColumns.Count:
        count = int.parse(data.toString());
        break;
      case CardColumns.Media:
        break;
      // this.resources = data.toString();
      default:
        return;
    }
  }


  //FOR FUTURE CARDS

  // int id;
  // String date;
  // String? author;
  // int? infoYear;
  // int? infoSource;
  // String? receiveType; //TODO: will be enum
  // int? infActNumber;
  // String? excavationDate;
  // String? description;
  // int? count;
  // String? material; //TODO: will be enum
  // String? size;
  // String? preservation;
  // int? registrationNumber;
  // String? storagePlace; //TODO: will be enum i guess...
  // int? inventoryNumber;
  // String? note;
  // List<Uint8>? media;
  // String? geodataLol;

  // Card(
  //     this.id,
  //     this.date,
  //     this.author,
  //     this.infoYear,
  //     this.infoSource,
  //     this.receiveType,
  //     this.infActNumber,
  //     this.excavationDate,
  //     this.description,
  //     this.count,
  //     this.material,
  //     this.size,
  //     this.preservation,
  //     this.registrationNumber,
  //     this.storagePlace,
  //     this.inventoryNumber,
  //     this.note,
  //     this.media,
  //     this.geodataLol);
}

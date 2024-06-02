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
  String receiveType; 
  String infoActNumber;
  DateTime excavationDate;
  String description;
  int count;
  String material;
  String size;
  String preservation;
  int registrationNumber;
  String storagePlaceId; 
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
    this.storagePlaceId,
    this.inventoryNumber,
    this.note,
    this.media,
    this.geodata
  );


ArchCard.fromJson(Map<String, dynamic> json):
  id = json['id'] as String,
  name = json['name'] as String,
  date = DateTime.parse(json['card_date'] as String),
  author = json['card_author'],
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
  storagePlaceId = json['storage_place'] as String,
  inventoryNumber = json['inventory_number'] as String,
  note = json['note'] ??'',
  // media = json['media']??'',
  media = base64Decode(json['media']),
  geodata = json['geodata'] as String;

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
}

// ignore_for_file: constant_identifier_names

import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter/material.dart';



enum CardColumns {
  Id,
  Name,
  Usage,
  Placement,
  Period,
  History,
  Appearance,
  Author,
  DataSource,
  Resources,
  CreationDate,
  ExcavationYear,
  ExcavationDate,
  ColumnsAmount
}

class ArchCard {
  int id;
  String name;
  String usage;
  String placement;
  String period;
  String history;
  String appearance;
  String author;
  String dataSource;
  Uint8List resources;
  String creationDate;
  String excavationYear;
  String excavationDate;

  ArchCard(
    this.id,
    this.name,
    this.usage,
    this.placement,
    this.period,
    this.history,
    this.appearance,
    this.author,
    this.dataSource,
    this.resources,
    this.creationDate,
    this.excavationYear,
    this.excavationDate,
  );

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

// ignore_for_file: constant_identifier_names

import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/card_screen/defs.dart';



class ArchCard {
  int? id;
  String name;
  String usageNames;
  String placement;
  String period;
  String history;
  String appearance;
  String author;
  String dataSource;
  Uint8List resources;
  String creationDate;
  String? excavationYear;
  String? excavationDate;

  ArchCard(
    this.id,
    this.name,
    this.usageNames,
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

  void setData(CardColumns column, Object data) {
    switch (column) {
      case CardColumns.Name:
        name = data.toString();
        break;
      case CardColumns.UsageNames:
        usageNames = data.toString();
        break;
      case CardColumns.Placement:
        placement = data.toString();
        break;
      case CardColumns.Period:
        period = data.toString();
        break;
      case CardColumns.History:
        history = data.toString();
        break;
      case CardColumns.Appearance:
        appearance = data.toString();
        break;
      case CardColumns.Author:
        author = data.toString();
        break;
      case CardColumns.DataSource:
        dataSource = data.toString();
        break;
      case CardColumns.Resources:
        break;
      // this.resources = data.toString();
      case CardColumns.CreationDate:
        creationDate = data.toString();
        break;
      default:
        return;
    }
  }

//TODO: REWRITE THIS ON CUSTOM METHOD

  bool isEqual(ArchCard other) {
    return other.name == name &&
        other.usageNames == usageNames &&
        other.placement == placement &&
        other.period == period &&
        other.history == history &&
        other.appearance == appearance &&
        other.author == author &&
        other.dataSource == dataSource &&
        other.resources == resources &&
        other.creationDate == creationDate;
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

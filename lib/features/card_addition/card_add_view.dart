//TODO генерация новых пользователей

import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/card_addition/date_picker.dart';
import 'package:flutter_application_2/features/card_addition/resources_picker.dart';
import 'package:flutter_application_2/features/cards_list/bloc/cards_list_bloc.dart';
import 'package:flutter_application_2/features/defs.dart';
import 'package:flutter_application_2/repositories/cards_list/cards_list_repository.dart';
import 'package:flutter_application_2/repositories/cards_list/models/card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class CardAddScreen extends StatelessWidget {
  final repository = GetIt.I<CardsListRepository>();
  final _globalKeys = <GlobalKey<FormState>>[];
  CardsListBloc cardsListBloc;
  final List<TextEditingController> _controllers = [];
  CardAddScreen({super.key, required this.cardsListBloc}) {
    for (int i = 0; i < CardColumns.ColumnsAmount.index; ++i) {
      _controllers.add(TextEditingController(text: labels[i]));
    }
  }

  @override
  Widget build(BuildContext context) {
    final resourcesSlot = MediaLoader();
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Новый паспорт'),
        actions: [
          IconButton(
              onPressed: () async {
                bool isValid = true;
                for (final key in _globalKeys) {
                  if (!key.currentState!.validate()) {
                    isValid = false;
                  }
                }
                if (isValid) {
                  var card = formCard();
                  if (card != null) {
                    // await repository.insertCard(card);
                    showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            title: Text('Сохранение'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircularProgressIndicator(),
                                SizedBox(height: 16.0),
                                Text('Подождите')
                              ],
                            ),
                          );
                        });
                    cardsListBloc.add(AddCard(card));
                  }
                }
              },
              icon: const Icon(Icons.check_sharp))
        ],
      ),
      body: ListView(
        children: [
          textData(labels[CardColumns.Name.index],
              _controllers[CardColumns.Name.index], theme),
          DatePicker(
            label: labels[CardColumns.Date.index],
            controller: _controllers[CardColumns.Date.index],
          ),
          textData(labels[CardColumns.StoragePlace.index],
              _controllers[CardColumns.StoragePlace.index], theme),
          textData(
            labels[CardColumns.Preservation.index],
            _controllers[CardColumns.Preservation.index],
            theme,
          ),
          textData(
            labels[CardColumns.Size.index],
            _controllers[CardColumns.Size.index],
            theme,
          ),
          DatePicker(
              label: labels[CardColumns.ExcavationDate.index],
              controller: _controllers[CardColumns.ExcavationDate.index]),
          textData(labels[CardColumns.Description.index],
              _controllers[CardColumns.Description.index], theme),
          textData(
            labels[CardColumns.RegistrationNumber.index],
            _controllers[CardColumns.RegistrationNumber.index],
            theme,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                labels[CardColumns.Media.index],
              ),
              SizedBox(
                height: 100,
                child: MediaLoader(),
              )
            ]),
          ),
          BlocListener<CardsListBloc, CardsListState>(
            bloc: cardsListBloc,
            listener: (context, state) {
              if (state is CardAddingSuccessful) {
                Navigator.of(context).pop();
                showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialog(
                        title: Text('Сохранение'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          // children: queryResult
                          children: [
                            Icon(
                              Icons.check,
                              color: Colors.green,
                              size: 60,
                            ),
                            Text('Успешно'),
                          ],
                        ),
                      );
                    });
                // }
                Future.delayed(const Duration(seconds: 2), () {
                  Navigator.of(context).pop();
                  Navigator.pop(context, 'refresh');
                  
                });
              }
              if (state is CardAddingFailed) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialog(
                        title: Text('Сохранение'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.error, color: Colors.red, size: 60),
                            Text('Ошибка создания'),
                          ],
                        ),
                      );
                    });
              }

              // TODO: implement listener
            },
            child: Container(),
          ),
        ],
      ),
    );
  }

  List<CardColumns> checkControllersData() {
    return [];
  }

  Widget textData(
      String label, TextEditingController controller, ThemeData theme,
      [bool bigField = false]) {
    final newKey = GlobalKey<FormState>();
    _globalKeys.add(newKey);
    return Form(
        key: newKey,
        child: Padding(
            padding: EdgeInsets.all(10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                label,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Поле не может быть пустым';
                  }
                },
                controller: controller,
                maxLines: bigField ? null : 1,
                decoration: const InputDecoration(
                  hintText: 'Введите текст',
                  border: OutlineInputBorder(borderSide: BorderSide(width: 4)),
                ),
                style: const TextStyle(fontSize: 20),
              ),
            ])));
  }

  ArchCard? formCard() {
    try {
      var createdDate = DateFormat('dd.MM.yyyy')
          .parse(_controllers[CardColumns.Date.index].text);
      var excavationDate = DateFormat('dd.MM.yyyy')
          .parse(_controllers[CardColumns.ExcavationDate.index].text);
      ArchCard result = ArchCard(
        Uuid().v4().toString(),
        _controllers[CardColumns.Name.index].text,
        createdDate,
        _controllers[CardColumns.Author.index].text,
        int.tryParse(_controllers[CardColumns.InfoYear.index].text) ?? 2000,
        _controllers[CardColumns.InfoSource.index].text,
        _controllers[CardColumns.ReceiveType.index].text,
        _controllers[CardColumns.InfoActNumber.index].text,
        excavationDate,
        _controllers[CardColumns.Description.index].text,
        int.tryParse(_controllers[CardColumns.Count.index].text) ?? 2000,
        _controllers[CardColumns.Material.index].text,
        _controllers[CardColumns.Size.index].text,
        _controllers[CardColumns.Preservation.index].text,
        int.tryParse(_controllers[CardColumns.RegistrationNumber.index].text) ??
            2000,
        _controllers[CardColumns.StoragePlace.index].text,
        _controllers[CardColumns.InventoryNumber.index].text,
        _controllers[CardColumns.Note.index].text,
        Uint8List(0),
        _controllers[CardColumns.Geodata.index].text,
      );
      return result;
    } on Exception catch (e) {
      return null;
    }
  }
}

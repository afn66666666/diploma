//TODO ссылки на геодату и в менюшке пункт карточек по раскопкам
//TODO посмотреть про распознавание объектов
//TODO поговорить про роли в БД
//TODO оффлайн режим
//TODO колонка проверяющий
//TODO история удаленных (опционально)
//TODO генерация новых пользователей

import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/card_addition/media_loader.dart';
import 'package:flutter_application_2/features/card_addition/resources_picker.dart';
import 'package:flutter_application_2/features/defs.dart';
import 'package:flutter_application_2/repositories/cards_list/models/card.dart';
import 'package:flutter_application_2/features/sql_connection/connector.dart';
import 'package:image_picker/image_picker.dart';

class CardAddScreen extends StatelessWidget {
  final List<TextEditingController> _controllers = [];
  CardAddScreen({super.key}) {
    for (int i = 0; i < CardColumns.ColumnsAmount.index; ++i) {
      _controllers.add(TextEditingController());
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
                  // var card = _createCard();
                  // bool queryResult = await connector.insertCard(card);
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pop();
                  // ignore: use_build_context_synchronously
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Сохранение'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            // children: queryResult
                            children: false
                                ? const [
                                    Icon(Icons.check_circle,
                                        color: Colors.green, size: 60),
                                    SizedBox(height: 16.0),
                                    Text('Подождите')
                                  ]
                                : const [
                                    Icon(
                                      Icons.error,
                                      color: Colors.red,
                                      size: 60,
                                    )
                                  ],
                          ),
                        );
                      });
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.check_sharp))
          ],
        ),
        body: ListView(
          children: [
            textData(labels[CardColumns.Name.index], theme),
            DatePicker(
              label: labels[CardColumns.Date.index],
            ),
            textData(labels[CardColumns.StoragePlace.index], theme),
            textData(
              labels[CardColumns.Preservation.index],
              theme,
            ),
            textData(
              labels[CardColumns.Size.index],
              theme,
            ),
            DatePicker(label: labels[CardColumns.ExcavationDate.index]),
            textData(labels[CardColumns.ExcavationDate.index], theme),
            textData(labels[CardColumns.Description.index], theme),
            textData(
              labels[CardColumns.RegistrationNumber.index],
              theme,
            ),
            MediaLoader()
          ],
        ));
  }

  // ArchCard _createCard() {
  //   return ArchCard(
  //       null,
  //       _controllers[CardColumns.Name.index].text,
  //       _controllers[CardColumns.UsageNames.index].text,
  //       _controllers[CardColumns.Placement.index].text,
  //       _controllers[CardColumns.Period.index].text,
  //       _controllers[CardColumns.History.index].text,
  //       _controllers[CardColumns.Appearance.index].text,
  //       _controllers[CardColumns.Author.index].text,
  //       _controllers[CardColumns.DataSource.index].text,
  //       Uint8List(0),
  //       _controllers[CardColumns.CreationDate.index].text,
  //       null,
  //       null);
  // }

  Widget textData(String label, ThemeData theme, [bool bigField = false]) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            label,
          ),
          TextFormField(
            maxLines: bigField ? null : 1,
            decoration: const InputDecoration(
              hintText: 'Введите текст',
              border: OutlineInputBorder(borderSide: BorderSide(width: 4)),
            ),
            style: const TextStyle(fontSize: 20),
            readOnly: true,
          ),
        ]));
  }

  // Widget dateData(String label, ThemeData theme, BuildContext context) {
  //   return Padding(
  //       padding: EdgeInsets.all(10),
  //       child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
  //         Text(
  //           label,
  //         ),
  //         TextField(
  //           onTap: () async {
  //             var pickedDate = await showDatePicker(
  //                 context: context,
  //                 initialDate: DateTime.now(),
  //                 firstDate: DateTime(1800),
  //                 lastDate: DateTime(2100));
  //             if(pickedDate != null){

  //             }
  //           },
  //           decoration: const InputDecoration(
  //             hintText: 'дд.мм.гггг',
  //             border: OutlineInputBorder(borderSide: BorderSide(width: 4)),
  //           ),
  //         )
  //       ]));
  // }
}

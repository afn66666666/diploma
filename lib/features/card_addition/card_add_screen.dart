//TODO ссылки на геодату и в менюшке пункт карточек по раскопкам
//TODO посмотреть про распознавание объектов
//TODO поговорить про роли в БД
//TODO оффлайн режим
//TODO колонка проверяющий
//TODO история удаленных (опционально)
//TODO генерация новых пользователей

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/card_screen/defs.dart';
import 'package:flutter_application_2/features/card/card.dart';
import 'package:flutter_application_2/features/sql_connection/connector.dart';
import 'package:provider/provider.dart';

class CardAddScreen extends StatelessWidget {
  final List<TextEditingController> _controllers = [];
  CardAddScreen({super.key}){
     for(int i =0;i<CardColumns.ColumnsAmount.index;++i){
      _controllers.add(TextEditingController());
     }
  }

  @override
  Widget build(BuildContext context) {
    final connector = Provider.of<Connector>(context);
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Создание новой карточки'),
        actions: [
          IconButton(onPressed: () {
            var card = createCard();
            connector.insertCard(card);   
          }, icon: const Icon(Icons.check_sharp))
        ],
      ),
      body: ListView(
        children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(
                  flangPadding, frontPadding, frontPadding, frontPadding),
              child: Text(labels[CardColumns.Name.index])),
          Padding(
              padding: const EdgeInsets.fromLTRB(
                  flangPadding, frontPadding, flangPadding, frontPadding),
              child: TextFormField(
                controller: _controllers[CardColumns.Name.index],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                minLines: 1,
                maxLines: 10,
              )),
          Padding(
              padding:
                  const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
              child: Text(labels[CardColumns.UsageNames.index])),
          Padding(
              padding:
                  const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
              child: TextFormField(
                controller: _controllers[CardColumns.UsageNames.index],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                minLines: 1,
                maxLines: 50,
              )),
          Padding(
            padding:
                const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
            child: Text(labels[CardColumns.Placement.index]),
          ),
          Padding(
              padding:
                  const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
              child: TextFormField(
                controller: _controllers[CardColumns.Placement.index],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                minLines: 1,
                maxLines: 50,
              )),
          Padding(
              padding:
                  const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
              child: Text(labels[CardColumns.Period.index])),
          Padding(
              padding:
                  const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
              child: TextFormField(
                controller: _controllers[CardColumns.Period.index],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                minLines: 1,
                maxLines: 10,
              )),
          Padding(
              padding:
                  const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
              child: Text(
                labels[CardColumns.History.index],
              )),
          Padding(
              padding:
                  const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
              child: TextFormField(
                controller: _controllers[CardColumns.History.index],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                minLines: 1,
                maxLines: 50,
              )),
          Padding(
              padding:
                  const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
              child: Text(
                labels[CardColumns.Appearance.index],
              )),
          Padding(
              padding:
                  const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
              child: TextFormField(
                controller: _controllers[CardColumns.Appearance.index],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                minLines: 1,
                maxLines: 50,
              )),
          Padding(
              padding:
                  const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
              child: Text(
                labels[CardColumns.Author.index],
              )),
          Padding(
              padding:
                  const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
              child: TextFormField(
                controller: _controllers[CardColumns.Author.index],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                minLines: 1,
                maxLines: 50,
              )),
          Padding(
              padding:
                  const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
              child: Text(
                labels[CardColumns.DataSource.index],
              )),
          Padding(
              padding:
                  const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
              child: TextFormField(
                controller: _controllers[CardColumns.DataSource.index],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                // decoration:
                //     const InputDecoration(border: OutlineInputBorder()),
                minLines: 1,
                maxLines: 50,
              )),
          Padding(
              padding:
                  const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
              child: Text(
                labels[CardColumns.Resources.index],
              )),
          Padding(
              padding:
                  const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
              child: Text(
                '',
                style: theme.textTheme.bodySmall,
              )),
          Padding(
              padding:
                  const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
              child: Text(
                labels[CardColumns.CreationDate.index],
              )),
          Padding(
              padding:
                  const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
              child: Text(
                '',
                style: theme.textTheme.bodySmall,
              )),
        ],
      ),
    );
  }

  ArchCard createCard(){
    return ArchCard(null,_controllers[CardColumns.Name.index].text,
     _controllers[CardColumns.UsageNames.index].text,
     _controllers[CardColumns.Placement.index].text,
      _controllers[CardColumns.Period.index].text,
      _controllers[CardColumns.History.index].text,
      _controllers[CardColumns.Appearance.index].text,
      _controllers[CardColumns.Author.index].text,
      _controllers[CardColumns.DataSource.index].text,
      Uint8List(0),
      _controllers[CardColumns.CreationDate.index].text,
      null,null);
  }
}

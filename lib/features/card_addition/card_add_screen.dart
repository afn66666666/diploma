//TODO ссылки на геодату и в менюшке пункт карточек по раскопкам
//TODO посмотреть про распознавание объектов
//TODO поговорить про роли в БД
//TODO оффлайн режим
//TODO колонка проверяющий
//TODO история удаленных (опционально)
//TODO генерация новых пользователей

import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/card_screen/defs.dart';
import 'package:flutter_application_2/features/cards_list/models/card.dart';

class CardAddScreen extends StatelessWidget {
  const CardAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Создание новой карточки'), actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.check_sharp))],),
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
                // initialValue: _archCard.name,
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
                // initialValue: _archCard.usage,
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
                // initialValue: _archCard.placement,
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
                // initialValue: _archCard.period,
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
                // initialValue: _archCard.appearance,
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
                labels[CardColumns.DataSource.index],
              )),
          Padding(
              padding:
                  const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
              child: TextFormField(
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
}

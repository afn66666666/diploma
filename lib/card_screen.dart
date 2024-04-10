import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/card.dart';

const double flangPadding = 10;
const double frontPadding = 5;

const List<String> labels = [
  ('Номер карточки'),
  'Наименование объекта',
  'Обиходные названия*',
  'Место размещения объекта',
  'Время возникновения, открытия объекта',
  'Краткая история объекта',
  'Внешние признаки (особенности стиля)',
  'Данные об авторах объекта',
  'Источники сведений об объекте',
  'Фотографии или видеоматериалы',
  'Дата составления карточки',
  'Год раскопок',
  'Дата раскопок'
];

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});
  @override
  State<StatefulWidget> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  late ArchCard _archCard;
  late String _title;
  late Timer _hideAnimationTimer;

  int _editFABPosition = 20;
  bool _isEditingMode = false;
  bool _isEditButtonHide = false;
  bool _hideAnimationBlocked = false;

  void setEditButtonVisibility(bool mode){
    _editFABPosition = mode ? 40 : -80;
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args == null) {
      print("args is null");
      return;
    }
    if (args is! ArchCard) {
      print("need ArchCard argument");
      return;
    }
    _archCard = args;
    _title = '${_archCard.name}: Сводка';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        setState(() {
          if (!_hideAnimationBlocked && !_isEditingMode) {
            _hideAnimationBlocked = true;
            Timer(const Duration(milliseconds: 300),
                () => _hideAnimationBlocked = false);
            _isEditButtonHide = !_isEditButtonHide;
            setEditButtonVisibility(_isEditButtonHide);
          }
        });
      },
      child: Scaffold(
        appBar: AppBar(
            title: Text(_title),
            actions: _isEditingMode
                ? [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _isEditingMode = false;
                        });
                      },
                      icon: const Icon(Icons.close),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.check_sharp),
                    )
                  ]
                : null),
        floatingActionButton: Stack(children: [
          AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              bottom: _editFABPosition.toDouble(),
              right: 20,
              child: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      _editFABPosition = -80;
                      _isEditingMode = !_isEditingMode;
                      setEditButtonVisibility(false);
                      _title = _isEditingMode
                          ? '${_archCard.name}: Сводка'
                          : '${_archCard.name}: Редактирование';
                    });
                  },
                  child: const Icon(Icons.edit))),
        ]),
        body: ListView(
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(
                    flangPadding, frontPadding, frontPadding, frontPadding),
                child: Text(labels[CardColumns.Name.index])),
            Padding(
                padding: const EdgeInsets.fromLTRB(
                    flangPadding, frontPadding, flangPadding, frontPadding),
                child: _isEditingMode
                    ? TextFormField(
                        initialValue: _archCard.name,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        minLines: 1,
                        maxLines: 10,
                      )
                    : Text(
                        _archCard.name,
                        style: theme.textTheme.bodySmall,
                      )),
            Padding(
                padding:
                    const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
                child: Text(labels[CardColumns.Usage.index])),
            Padding(
                padding:
                    const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
                child: _isEditingMode
                    ? TextFormField(
                        initialValue: _archCard.usage,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        minLines: 1,
                        maxLines: 50,
                      )
                    : Text(
                        _archCard.usage.isEmpty
                            ? "Данные отсутствуют"
                            : _archCard.usage,
                        style: theme.textTheme.bodySmall,
                      )),
            Padding(
              padding:
                  const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
              child: Text(labels[CardColumns.Placement.index]),
            ),
            Padding(
                padding:
                    const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
                child: _isEditingMode
                    ? TextFormField(
                        initialValue: _archCard.placement,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        minLines: 1,
                        maxLines: 50,
                      )
                    : Text(
                        _archCard.placement,
                        style: theme.textTheme.bodySmall,
                      )),
            Padding(
                padding:
                    const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
                child: Text(labels[CardColumns.Period.index])),
            Padding(
                padding:
                    const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
                child: _isEditingMode
                    ? TextFormField(
                        initialValue: _archCard.period,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        minLines: 1,
                        maxLines: 10,
                      )
                    : Text(
                        _archCard.period,
                        style: theme.textTheme.bodySmall,
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
                child: _isEditingMode
                    ? TextFormField(
                        initialValue: _archCard.history,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        minLines: 1,
                        maxLines: 50,
                      )
                    : Text(
                        _archCard.history,
                        style: theme.textTheme.bodySmall,
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
                child: _isEditingMode
                    ? TextFormField(
                        initialValue: _archCard.appearance,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        minLines: 1,
                        maxLines: 50,
                      )
                    : Text(
                        _archCard.appearance,
                        style: theme.textTheme.bodySmall,
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
                child: _isEditingMode
                    ? TextFormField(
                        initialValue: _archCard.author,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        // decoration:
                        //     const InputDecoration(border: OutlineInputBorder()),
                        minLines: 1,
                        maxLines: 50,
                      )
                    : Text(
                        _archCard.author,
                        style: theme.textTheme.bodySmall,
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
                child: _isEditingMode
                    ? TextFormField(
                        initialValue: _archCard.dataSource,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        // decoration:
                        //     const InputDecoration(border: OutlineInputBorder()),
                        minLines: 1,
                        maxLines: 50,
                      )
                    : Text(
                        _archCard.dataSource,
                        style: theme.textTheme.bodySmall,
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
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(onPressed: (){}),
    );
  }
}

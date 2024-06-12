import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/cards_list/bloc/cards_list_bloc.dart';
import 'package:flutter_application_2/features/cards_list/view/card_tile.dart';
import 'package:flutter_application_2/repositories/cards_list/cards_list_repository.dart';
import 'package:flutter_application_2/repositories/cards_list/models/card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

class RequestsView extends StatefulWidget {
  const RequestsView({
    super.key,
  });
  @override
  State<StatefulWidget> createState() => _RequestsViewState();
}

class _RequestsViewState extends State<RequestsView> {
  final rep = GetIt.I<CardsListRepository>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var addStyle = TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Colors.green.shade600);
    var editStyle = TextStyle(fontSize: 12, color: Colors.orange.shade800);
    var removeStyle = TextStyle(fontSize: 12, color: Colors.red.shade600);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Заявки"),
        ),
        body: ListView.separated(
          itemCount: rep.loadedCards.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            if (index < 3) {
              return CardTileSP(
                  status: 1,
                  card: rep.loadedCards[index],
                  isEditMode: false,
                  setEditMode: () {});
            } else {
              return CardTileSP(
                  status: 2,
                  card: rep.loadedCards[index],
                  isEditMode: false,
                  setEditMode: () {});
            }
          },
        ));
  }
}

class CardTileSP extends StatefulWidget {
  int status;
  final ArchCard card;
  bool isEditMode;
  bool isChecked = false;
  Function setEditMode;
  CardTileSP(
      {super.key,
      required this.status,
      required this.card,
      required this.isEditMode,
      required this.setEditMode});

  @override
  State<StatefulWidget> createState() => _CardTileState();
}

class _CardTileState extends State<CardTileSP> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    log("cardTile builded");

    final theme = Theme.of(context);
    // var icon = Image.memory(widget.card.resources);
    Color color = Colors.white;
    if (widget.status == 1) {
      color = Colors.green.shade100;
    }
    if (widget.status == 2) {
      color = Colors.yellow.shade100;
    }
    return GestureDetector(
        onLongPress: () {
          if (!widget.isEditMode) {
            setState(() {
              _isChecked = true;
              widget.setEditMode();
            });
          }
        },
        child: ListTile(
            tileColor: color,
            leading: widget.isEditMode
                ? Checkbox(
                    value: _isChecked,
                    onChanged: (onChanged) {
                      setState(() {
                        _isChecked = !_isChecked;
                      });
                    })
                : ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: 104,
                      minHeight: 104,
                      maxWidth: 104,
                      maxHeight: 104,
                    ),
                    child: Image.memory(widget.card.media, fit: BoxFit.cover),
                  ),
            title: Text(widget.card.name, style: theme.textTheme.bodyMedium),
            subtitle:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Text(widget.card.registrationNumber.toString(),
                    style: theme.textTheme.labelSmall),SizedBox(width: 50),Text('student',style: theme.textTheme.labelSmall,)
              ]),
              Row(children: [
                Text('АМВУ', style: theme.textTheme.labelSmall),
                const SizedBox(width: 50),
                Text(
                  DateFormat('dd.MM.yyyy').format(widget.card.date),
                  style: theme.textTheme.labelSmall,
                )
              ]),
            ]),
            trailing: widget.isEditMode
                ? null
                : IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed('/card_screen', arguments: widget.card);
                    },
                    icon: const Icon(Icons.arrow_forward),
                  )));
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import '../../../repositories/cards_list/models/card.dart';

class CardTile extends StatefulWidget {
  final ArchCard card;
  bool isEditMode;
  bool isChecked = false;
  final Function(int, bool) callback;
  CardTile(
      {super.key,
      required this.card,
      required this.isEditMode,
      required this.callback});

  @override
  State<StatefulWidget> createState() => _CardTileState();
}

class _CardTileState extends State<CardTile> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    log("cardTile builded");

    final theme = Theme.of(context);
    // var icon = Image.memory(widget.card.resources);

    return GestureDetector(
        onLongPress: () {
          if (!widget.isEditMode) {
            // widget.callback(widget.card.id, true);
            setState(() {
              _isChecked = true;
              widget.isEditMode = true;
            });
          }
        },
        child: ListTile(
            leading: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 104,
                minHeight: 104,
                maxWidth: 104,
                maxHeight: 104,
              ),
              child: Image.memory(widget.card.media, fit: BoxFit.cover),
            ),
            title: Text(widget.card.name, style: theme.textTheme.bodyMedium),
            subtitle: Column( crossAxisAlignment: CrossAxisAlignment.start,children: [
              Text(widget.card.registrationNumber.toString(),
                  style: theme.textTheme.labelSmall),
              Text('АМВУ',style: theme.textTheme.labelSmall)
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

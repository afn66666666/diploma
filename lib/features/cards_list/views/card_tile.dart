import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/card_screen/card_screen.dart';
import 'package:flutter_application_2/main.dart';
import 'package:provider/provider.dart';
import '../models/card.dart';

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
    var icon = Image.memory(widget.card.resources);

    return GestureDetector(
        onLongPress: () {
          if (!widget.isEditMode) {
            widget.callback(widget.card.id??0, true);
            setState(() {
              _isChecked = true;
              widget.isEditMode = true;
            });
          }
        },
        child: ListTile(
            leading: widget.isEditMode
                ? Checkbox(
                    value: _isChecked,
                    onChanged: (newVal) {
                      setState(() {
                        _isChecked = newVal ?? false;
                      });
                      widget.callback(widget.card.id??0, _isChecked);
                    })
                : null,
            title: Text(widget.card.name, style: theme.textTheme.bodyMedium),
            subtitle: Text(widget.card.placement.toString(),
                style: theme.textTheme.labelSmall),
            trailing: widget.isEditMode ? null:IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed('/card_screen', arguments: widget.card);
              },
              icon: const Icon(Icons.arrow_forward),
            )));
  }
}

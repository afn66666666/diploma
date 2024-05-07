import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/card_screen/card_screen.dart';
import 'package:flutter_application_2/main.dart';
import 'package:provider/provider.dart';
import '../../card/card.dart';

class CardTile extends StatefulWidget {
  final ArchCard _card;
  final int _index;
  final bool _isEditMode;
  bool _isChecked = false;
  final Function(int, bool) callback;
  CardTile(
      {Key? key,
      required int index,
      required ArchCard card,
      required bool isEditMode,
      required this.callback})
      : _card = card,
        _index = index,
        _isEditMode = isEditMode,
        super(key: key);

  @override
  State<StatefulWidget> createState() => _CardTileState();
  // @override
  // Widget build(BuildContext context) {
  //   print("cardTile builded");
  //   final theme = Theme.of(context);
  //   var icon = Image.memory(_card.resources);

  //   return GestureDetector(
  //       child: ListTile(
  //           leading: _isEditMode
  //               ? Checkbox(
  //                   value: _isChecked,
  //                   onChanged: (newVal) {
  //                     _isChecked = newVal ?? false;
  //                   })
  //               : null,
  //           title: Text(_card.name, style: theme.textTheme.bodyMedium),
  //           subtitle: Text(_card.placement.toString(),
  //               style: theme.textTheme.labelSmall),
  //           trailing: IconButton(
  //             onPressed: () {
  //               Navigator.of(context)
  //                   .pushNamed('/card_screen', arguments: _card);
  //             },
  //             icon: const Icon(Icons.arrow_forward),
  //           )));
  // }
}

class _CardTileState extends State<CardTile> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    print("cardTile builded");
    final theme = Theme.of(context);
    var icon = Image.memory(widget._card.resources);

    return GestureDetector(
        onLongPress: () {
          if (!widget._isEditMode) {
            widget.callback(widget._index, true);
            setState(() {
              _isChecked = true;
            });
          }
        },
        child: ListTile(
            leading: widget._isEditMode
                ? Checkbox(
                    value: _isChecked,
                    onChanged: (newVal) {
                      setState(() {
                        _isChecked = newVal ?? false;
                      });
                      widget.callback(widget._index, _isChecked);
                    })
                : null,
            title: Text(widget._card.name, style: theme.textTheme.bodyMedium),
            subtitle: Text(widget._card.placement.toString(),
                style: theme.textTheme.labelSmall),
            trailing: IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed('/card_screen', arguments: widget._card);
              },
              icon: const Icon(Icons.arrow_forward),
            )));
  }
}

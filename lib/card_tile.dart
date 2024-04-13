import 'package:flutter/material.dart';
import 'package:flutter_application_2/card_screen.dart';
import 'card.dart';

class CardTile extends StatelessWidget {
  final ArchCard card;
  const CardTile({Key? key, required this.card}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var icon = Image.memory(card.resources);

    return ListTile(
        title: Text(card.name, style: theme.textTheme.bodyMedium),
        subtitle:
            Text(card.placement.toString(), style: theme.textTheme.labelSmall),
        trailing: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/card_screen', arguments: card);
          },
          icon: const Icon(Icons.arrow_forward),
        ));
  }
}

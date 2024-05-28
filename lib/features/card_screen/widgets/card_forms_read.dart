import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/defs.dart';
import 'package:flutter_application_2/repositories/cards_list/models/card.dart';



class CardFormsRead extends StatelessWidget {
  final ArchCard _archCard;
  CardFormsRead(this._archCard, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView(
      children: [
      //   Padding(
      //       padding: const EdgeInsets.fromLTRB(
      //           flangPadding, frontPadding, frontPadding, frontPadding),
      //       child: Text(labels[CardColumns.Name.index])),
      //   Padding(
      //       padding: const EdgeInsets.fromLTRB(
      //           flangPadding, frontPadding, flangPadding, frontPadding),
      //       child: Text(
      //         _archCard.name,
      //         style: theme.textTheme.bodySmall,
      //       )),
      //   Padding(
      //       padding:
      //           const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
      //       child: Text(labels[CardColumns.UsageNames.index])),
      //   Padding(
      //       padding:
      //           const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
      //       child: Text(
      //         _archCard.usageNames.isEmpty
      //             ? "Данные отсутствуют"
      //             : _archCard.usageNames,
      //         style: theme.textTheme.bodySmall,
      //       )),
      //   Padding(
      //     padding: const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
      //     child: Text(labels[CardColumns.Placement.index]),
      //   ),
      //   Padding(
      //       padding:
      //           const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
      //       child: Text(
      //         _archCard.placement,
      //         style: theme.textTheme.bodySmall,
      //       )),
      //   Padding(
      //       padding:
      //           const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
      //       child: Text(labels[CardColumns.Period.index])),
      //   Padding(
      //       padding:
      //           const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
      //       child: Text(
      //         _archCard.period,
      //         style: theme.textTheme.bodySmall,
      //       )),
      //   Padding(
      //       padding:
      //           const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
      //       child: Text(
      //         labels[CardColumns.History.index],
      //       )),
      //   Padding(
      //       padding:
      //           const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
      //       child: Text(
      //         _archCard.history,
      //         style: theme.textTheme.bodySmall,
      //       )),
      //   Padding(
      //       padding:
      //           const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
      //       child: Text(
      //         labels[CardColumns.Appearance.index],
      //       )),
      //   Padding(
      //       padding:
      //           const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
      //       child: Text(
      //         _archCard.appearance,
      //         style: theme.textTheme.bodySmall,
      //       )),
      //   Padding(
      //       padding:
      //           const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
      //       child: Text(
      //         labels[CardColumns.Author.index],
      //       )),
      //   Padding(
      //       padding:
      //           const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
      //       child: Text(
      //         _archCard.author,
      //         style: theme.textTheme.bodySmall,
      //       )),
      //   Padding(
      //       padding:
      //           const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
      //       child: Text(
      //         labels[CardColumns.InfoSource.index],
      //       )),
      //   Padding(
      //       padding:
      //           const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
      //       child: Text(
      //         _archCard.dataSource,
      //         style: theme.textTheme.bodySmall,
      //       )),
      //   Padding(
      //       padding:
      //           const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
      //       child: Text(
      //         labels[CardColumns.Media.index],
      //       )),
      //   Padding(
      //       padding:
      //           const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
      //       child: Text(
      //         '',
      //         style: theme.textTheme.bodySmall,
      //       )),
      //   Padding(
      //       padding:
      //           const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
      //       child: Text(
      //         labels[CardColumns.CreationDate.index],
      //       )),
      //   Padding(
      //       padding:
      //           const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
      //       child: Text(
      //         _archCard.creationDate,
      //         style: theme.textTheme.bodySmall,
      //       )),
       ],
    );
  }
}

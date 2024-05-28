import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/defs.dart';
import 'package:flutter_application_2/repositories/cards_list/models/card.dart';


class CardFormsEdit extends StatefulWidget {
  final ArchCard _archCard;
  final List<TextEditingController> _controllers = [];
  CardFormsEdit(this._archCard, {super.key}) {
    // _controllers.add(TextEditingController(text: _archCard.id.toString()));
    // _controllers.add(TextEditingController(text: _archCard.name));
    // _controllers.add(TextEditingController(text: _archCard.usageNames));
    // _controllers.add(TextEditingController(text: _archCard.placement));
    // _controllers.add(TextEditingController(text: _archCard.usageNames));
    // _controllers.add(TextEditingController(text: _archCard.period));
    // _controllers.add(TextEditingController(text: _archCard.history));
    // _controllers.add(TextEditingController(text: _archCard.appearance));
    // _controllers.add(TextEditingController(text: _archCard.author));
    // _controllers.add(TextEditingController(text: _archCard.dataSource));
    // _controllers.add(TextEditingController(text: _archCard.creationDate));
  }
  @override
  State<StatefulWidget> createState() => _CardFormsEditState();


  void updateCard(){
    // _archCard.name =_controllers[CardColumns.Name.index].text;
    // _archCard.usageNames =_controllers[CardColumns.UsageNames.index].text;
    // _archCard.history =_controllers[CardColumns.History.index].text;
    // _archCard.placement =_controllers[CardColumns.Placement.index].text;
    // _archCard.appearance =_controllers[CardColumns.Appearance.index].text;
    // _archCard.creationDate =_controllers[CardColumns.CreationDate.index].text;
    // _archCard.period =_controllers[CardColumns.Period.index].text;
    // _archCard.dataSource =_controllers[CardColumns.DataSource.index].text;
    // _archCard.author =_controllers[CardColumns.Author.index].text;
  }
}

class _CardFormsEditState extends State<CardFormsEdit> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView(
      children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(
                flangPadding, frontPadding, frontPadding, frontPadding),
            child: Text(labels[CardColumns.Name.index])),
        Padding(
            padding: const EdgeInsets.fromLTRB(
                flangPadding, frontPadding, flangPadding, frontPadding),
            child: TextFormField(
              controller: widget._controllers[CardColumns.Name.index],
              // initialValue: _archCard.name,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              minLines: 1,
              maxLines: 10,
            )),
        // Padding(
        //     padding:
        //         const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
        //     child: Text(labels[CardColumns.UsageNames.index])),
        // Padding(
        //     padding:
        //         const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
        //     child: TextFormField(
        //       controller: widget._controllers[CardColumns.UsageNames.index],
        //       // initialValue: _archCard.usage,
        //       decoration: const InputDecoration(
        //         border: OutlineInputBorder(),
        //       ),
        //       minLines: 1,
        //       maxLines: 50,
        //     )),
        // Padding(
        //   padding: const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
        //   child: Text(labels[CardColumns.Placement.index]),
        // ),
        // Padding(
        //     padding:
        //         const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
        //     child: TextFormField(
        //       controller: widget._controllers[CardColumns.Placement.index],
        //       // initialValue: _archCard.placement,
        //       decoration: const InputDecoration(
        //         border: OutlineInputBorder(),
        //       ),
        //       minLines: 1,
        //       maxLines: 50,
        //     )),
        // Padding(
        //     padding:
        //         const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
        //     child: Text(labels[CardColumns.Period.index])),
        // Padding(
        //     padding:
        //         const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
        //     child: TextFormField(
        //       controller: widget._controllers[CardColumns.Period.index],
        //       // initialValue: _archCard.period,
        //       decoration: const InputDecoration(
        //         border: OutlineInputBorder(),
        //       ),
        //       minLines: 1,
        //       maxLines: 10,
        //     )),
        // Padding(
        //     padding:
        //         const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
        //     child: Text(
        //       labels[CardColumns.History.index],
        //     )),
        // Padding(
        //     padding:
        //         const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
        //     child: TextFormField(
        //       controller: widget._controllers[CardColumns.History.index],
        //       // initialValue: _archCard.history,
        //       decoration: const InputDecoration(
        //         border: OutlineInputBorder(),
        //       ),
        //       minLines: 1,
        //       maxLines: 50,
        //     )),
        // Padding(
        //     padding:
        //         const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
        //     child: Text(
        //       labels[CardColumns.Appearance.index],
        //     )),
        // Padding(
        //     padding:
        //         const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
        //     child: TextFormField(
        //       controller: widget._controllers[CardColumns.Appearance.index],
        //       // initialValue: _archCard.appearance,
        //       decoration: const InputDecoration(
        //         border: OutlineInputBorder(),
        //       ),
        //       minLines: 1,
        //       maxLines: 50,
        //     )),
        // Padding(
        //     padding:
        //         const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
        //     child: Text(
        //       labels[CardColumns.Author.index],
        //     )),
        // Padding(
        //     padding:
        //         const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
        //     child: TextFormField(
        //       initialValue: widget._archCard.author,
        //       decoration: const InputDecoration(
        //         border: OutlineInputBorder(),
        //       ),
        //       // decoration:
        //       //     const InputDecoration(border: OutlineInputBorder()),
        //       minLines: 1,
        //       maxLines: 50,
        //     )),
        // Padding(
        //     padding:
        //         const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
        //     child: Text(
        //       labels[CardColumns.DataSource.index],
        //     )),
        // Padding(
        //     padding:
        //         const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
        //     child: TextFormField(
        //       controller: widget._controllers[CardColumns.DataSource.index],
        //       // initialValue: _archCard.dataSource,
        //       decoration: const InputDecoration(
        //         border: OutlineInputBorder(),
        //       ),
        //       // decoration:
        //       //     const InputDecoration(border: OutlineInputBorder()),
        //       minLines: 1,
        //       maxLines: 50,
        //     )),
        // Padding(
        //     padding:
        //         const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
        //     child: Text(
        //       labels[CardColumns.Media.index],
        //     )),
        // Padding(
        //     padding:
        //         const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
        //     child: Text(
        //       '',
        //       style: theme.textTheme.bodySmall,
        //     )),
        // Padding(
        //     padding:
        //         const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
        //     child: Text(
        //       labels[CardColumns.Media.index],
        //     )),
        // Padding(
        //     padding:
        //         const EdgeInsets.fromLTRB(flangPadding, 5, flangPadding, 5),
        //     child: Text(
        //       widget._archCard.creationDate,
        //       style: theme.textTheme.bodySmall,
        //     )),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/cards_list/bloc/cards_list_bloc.dart';
import 'package:flutter_application_2/features/cards_list/view/card_tile.dart';
import 'package:flutter_application_2/repositories/cards_list/cards_list_repository.dart';
import 'package:flutter_application_2/repositories/cards_list/models/card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class RequestsView extends StatefulWidget {
  const RequestsView({super.key});

  @override
  State<StatefulWidget> createState() => _RequestsViewState();
}

class _RequestsViewState extends State<RequestsView> {
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
            itemCount: 5,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              if (index == 0) {
                return ListTile(
                  trailing: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.arrow_forward)),
                  title: Text('Card $index'),
                  subtitle: Row(children: [
                    Text(
                      'Изменение',
                      style: editStyle,
                    ),
                    SizedBox(width: 30,), 
                    Text('Ответственный'),
                  ]),
                );
              }
              if (index == 1) {
                return ListTile(
                  title: Text('Card $index'),
                  subtitle: Row(children: [
                    Text(
                      'Изменение',
                      style: editStyle,
                    ),
                    SizedBox(width: 30,), 
                    Text('Ответственный'),
                  ]),
                );
              }
              if (index == 2) {
                return ListTile(
                  title: Text('Card $index'),
                  subtitle: Row(children: [
                    Text(
                      'Изменение',
                      style: editStyle,
                    ),SizedBox(width: 30,), 
                    Text('Ответственный'),
                  ]),
                );
              }
              return ListTile(
                title: Text('Card $index'),
                subtitle: Text(
                  'Удаление',
                  style: removeStyle,
                ),
              );
            }));
  }
}

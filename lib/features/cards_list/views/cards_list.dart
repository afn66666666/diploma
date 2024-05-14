import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/cards_list/views/card_tile.dart';
import 'package:flutter_application_2/features/side_menu/side_menu.dart';
import 'package:flutter_application_2/features/sql_connection/connector.dart';
import 'package:provider/provider.dart';

class CardsScreen extends StatefulWidget {
  const CardsScreen({super.key});

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  final Set<int> selectedCards = {};
  bool isFloatingButtonShow = false;
  bool isEditMode = false;
  bool isBusy = false;
  @override
  void initState() {
    super.initState();
  }

  void changeSelection(int id, bool value) {
    if (!isEditMode) {
      setState(() {
        isEditMode = true;
      });
    }
    if (value) {
      selectedCards.add(id);
    } else {
      if (selectedCards.contains(id)) {
        selectedCards.remove(id);
      }
    }
    log(selectedCards.toString());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    print('cards screen build');
    return GestureDetector(
        onTap: () {
          if (!isEditMode) {
            setState(() {
              isFloatingButtonShow = !isFloatingButtonShow;
            });
          }
        },
        child: Scaffold(
            drawer: isEditMode ? null : const SideMenu(),
            //add card button.
            floatingActionButton: Stack(children: [
              AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  bottom: isFloatingButtonShow ? 20 : -80,
                  right: 20,
                  child: FloatingActionButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/add_card');
                      },
                      child: const Icon(Icons.add))),
            ]),
            appBar: AppBar(
              leading: isEditMode
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isEditMode = false;
                        });
                      },
                      icon: const Icon(Icons.cancel),
                    )
                  : null,
              title: isEditMode ? null : const Text('ACS'),
              actions: isEditMode
                  ? [
                      IconButton(
                          onPressed: () async {
                            showDialog(
                                context: context,
                                builder: ((context) {
                                  return const AlertDialog(
                                    title: Text('Удаление'),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CircularProgressIndicator(),
                                        SizedBox(height: 16.0),
                                        Text('Удаление данных. Подождите')
                                      ],
                                    ),
                                  );
                                }));
                            var connector =
                                Provider.of<Connector>(context, listen: false);
                            bool res =
                                await connector.removeCards(selectedCards);
                            if (res) {
                              setState(() {
                                selectedCards.clear();
                                Navigator.of(context).pop();
                              });
                            }
                            else{
                              
                            }
                            // ignore: use_build_context_synchronously
                          },
                          icon: const Icon(Icons.delete_outline))
                    ]
                  : [
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.sort)),
                    ],
            ),
            body: Center(child: Consumer<Connector>(
              builder: (context, connector, child) {
                if (connector.connected) {
                  var archCards = connector.cardsMap.entries
                      .map((iterator) => iterator.value)
                      .toList();
                  return ListView.separated(
                      itemCount: archCards.length,
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) {
                        if (index < archCards.length) {
                          return GestureDetector(
                              key: ValueKey(archCards[index]),
                              child: CardTile(
                                  isEditMode: isEditMode,
                                  card: archCards[index],
                                  callback: changeSelection));
                        }
                        return null;
                      });
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ))));
  }
}

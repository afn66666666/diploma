import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/authorization/authorization_screen.dart';
import 'package:flutter_application_2/features/card/card.dart';
import 'package:flutter_application_2/features/card_addition/card_add_screen.dart';
import 'package:flutter_application_2/features/card_screen/card_screen.dart';
import 'package:flutter_application_2/features/sql_connection/connector.dart';
import 'package:flutter_application_2/features/side_menu/side_menu.dart';
import 'package:provider/provider.dart';
import 'features/card_screen/defs.dart';
import 'features/cards_list/views/card_tile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Connector(),
        child: MaterialApp(
          title: 'Archeology Cards Storage',
          theme: ThemeData(
            dividerColor: Colors.purple.shade200,
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.purple,
                titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 23),
                iconTheme: IconThemeData(color: Colors.white)),
            textTheme: const TextTheme(
                bodySmall: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
                bodyMedium: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
                labelSmall: TextStyle(
                    color: Color.fromARGB(255, 53, 52, 52),
                    fontWeight: FontWeight.w700,
                    fontSize: 14)),
          ),
          routes: {
            '/': (context) {
              return isAuthorizationEnabled
                  ? AuthorizationScreen()
                  : const CardsScreen();
            },
            '/card_screen': (context) => const CardScreen(),
            '/add_card': (context) => CardAddScreen()
          },
        ));
  }
}

class CardsScreen extends StatefulWidget {
  const CardsScreen({super.key});

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  final Set<int> _ii = {};
  bool isFloatingButtonShow = false;
  bool isEditMode = false;
  bool _isBusy = false;
  @override
  void initState() {
    super.initState();
  }

  void changeSelection(int index, bool value) {
    if (!isEditMode) {
      setState(() {
        isEditMode = true;
      });
    }
    if (value) {
      _ii.add(index);
    } else {
      if (_ii.contains(index)) {
        _ii.remove(index);
      }
    }
    print(_ii);
  }

  @override
  Widget build(BuildContext context) {
    print('cards screen build');
    final connector = Provider.of<Connector>(context);
    final cards =
        connector.map.entries.map((iterator) => iterator.value).toList();
    if (!connector.connected) {
      return const Scaffold(
          body: Center(
        child: CircularProgressIndicator(),
      ));
    } else {
      return GestureDetector(
          onTap: () {
            if (!isEditMode) {
              setState(() {
                isFloatingButtonShow = !isFloatingButtonShow;
              });
            }
          },
          child: Scaffold(
              drawer: isEditMode ? const SideMenu() : null,
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
                            onPressed: () {
                              Set<ArchCard> cardsToRemove = {};
                              for (var elem in _ii) {
                                cardsToRemove.add(cards[elem]);
                              }
                              connector.removeCards(cardsToRemove);
                              setState(() {
                                isEditMode = false;
                              });
                            },
                            icon: const Icon(Icons.delete_outline))
                      ]
                    : [
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.sort))
                      ],
              ),
              body: Center(
                child: ListView.separated(
                    itemCount: 10,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) {
                      if (index < cards.length) {
                        return GestureDetector(
                            child: CardTile(
                                index: index,
                                isEditMode: isEditMode,
                                card: cards[index],
                                callback: changeSelection));
                        // child: CardTile(
                        //   card: cards[index],
                        //   editMode: _isEditMode,
                        // ));
                      }
                    }),
              )));
    }
  }
}

//TODO: удаление
// личный кабинет
// медиа 
// окошки ошибок
// поиск и фильтрация
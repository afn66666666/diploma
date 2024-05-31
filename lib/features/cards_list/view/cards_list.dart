import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/cards_list/bloc/cards_list_bloc.dart';
import 'package:flutter_application_2/repositories/cards_list/models/card.dart';
import 'package:flutter_application_2/features/cards_list/view/search_view.dart';
import 'package:flutter_application_2/features/cards_list/view/card_tile.dart';
import 'package:flutter_application_2/features/side_menu/side_menu.dart';
import 'package:flutter_application_2/repositories/cards_list/cards_list_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CardsList extends StatefulWidget {
  CardsList({super.key});

  @override
  State<CardsList> createState() => _CardsListState();
}

class _CardsListState extends State<CardsList> {
  final _cardsListBloc = CardsListBloc(GetIt.I<CardsListRepository>());
  var _searchParams = HashMap<String, String>();
  final Set<int> selectedCards = {};
  bool isFloatingButtonShow = false;
  bool isEditMode = false;
  bool isBusy = false;
  @override
  void initState() {
    _cardsListBloc.add(LoadCardsList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    log('cards screen build');
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
                          },
                          icon: const Icon(Icons.delete_outline))
                    ]
                  : [
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SearchView(
                                        setParameter: _setSearchParam,
                                        removeParameter: _removeSearchParam)));
                          },
                          icon: _searchParams.isEmpty
                              ? const Icon(Icons.search_rounded)
                              : Row(children: [
                                  const Icon(Icons.search_rounded),
                                  Text('(${_searchParams.length})',
                                      style: theme.appBarTheme.titleTextStyle)
                                ])),
                    ],
            ),
            body: Center(
                child: BlocBuilder<CardsListBloc, CardsListState>(
              bloc: _cardsListBloc,
              builder: (context, state) {
                if (state is CardsListLoaded) {
                  return ListView.separated(
                      itemCount: state.cards.length + 1,
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) {
                        if (index < state.cards.length) {
                          return GestureDetector(
                              child: CardTile(
                                  isEditMode: isEditMode,
                                  card: state.cards[index],
                                  ));
                        } else {
                          _cardsListBloc.add(LoadCardsList());
                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 32),
                            child: Center(
                              child: const CircularProgressIndicator(),
                            ),
                          );
                        }
                      });
                } else if (state is CardsListLoadEnded) {
                  return ListView.separated(
                      itemCount: state.cards.length,
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) {
                        if (index < state.cards.length) {
                          return GestureDetector(
                              child: CardTile(
                                  isEditMode: isEditMode,
                                  card: state.cards[index],
                                  ));
                        }
                      });
                } else if (state is CardsListLoadingFailed) {
                  return Center(
                      child: Column(children: [
                    Text('error'),
                    TextButton(onPressed: () {}, child: Text('retry'))
                  ]));
                }
                return const CircularProgressIndicator();
              },
            ))));
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

  void _setSearchParam(String name, String value) {
    setState(() {
      _searchParams[name] = value;
    });
  }

  void _removeSearchParam(String name) {
    setState(() {
      _searchParams.remove(name);
    });
  }

  List<ArchCard> filtrate(List<ArchCard> archCards) {
    List<ArchCard> validatedCards = [];
    // for (var card in archCards) {
    //   int successFlag = 0;
    //   for (var pair in _searchParams.entries) {
    //     if (pair.key == 'name') {
    //       if (card.name.contains(pair.value)) {
    //         ++successFlag;
    //       }
    //     }
    //     if (pair.key == 'placement') {
    //       if (card.placement.contains(pair.value)) {
    //         ++successFlag;
    //       }
    //     }
    //   }
    //   if (successFlag == _searchParams.length) {
    //     validatedCards.add(card);
    //   }
    // }
    return validatedCards;
  }
}

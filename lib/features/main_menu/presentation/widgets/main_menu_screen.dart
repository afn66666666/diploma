


import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/cards_list/view/SearchView.dart';
import 'package:flutter_application_2/features/main_menu/presentation/widgets/cards_list.dart';
import 'package:flutter_application_2/features/side_menu/side_menu.dart';

class MainMenuScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

}


class _MainMenuState extends State<MainMenuScreen>{

  bool isFloatingButtonShow = false;
  bool isEditMode = false;
  bool isBusy = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
                                        setParameter: (){},
                                        removeParameter: (){})));
                          },
                          icon: false
                              ? const Icon(Icons.search_rounded)
                              : Row(children: [
                                  const Icon(Icons.search_rounded),
                                  Text('колво параметров для поиска', style: theme.appBarTheme.titleTextStyle)
                                ])),
                    ],
            ),
            body: CardsList()));
  }
}
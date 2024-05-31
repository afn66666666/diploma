import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/card/widgets/card_forms_edit.dart';
import 'package:flutter_application_2/features/card/widgets/card_forms_read.dart';
import 'package:flutter_application_2/excavation_map/map_screen.dart';
import 'package:flutter_application_2/repositories/cards_list/models/card.dart';
import 'package:flutter_application_2/features/defs.dart';
import 'package:flutter_application_2/features/sql_connection/connector.dart';
import 'package:provider/provider.dart';

const double flangPadding = 10;
const double frontPadding = 5;

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});
  @override
  State<StatefulWidget> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  late ArchCard _archCard;

  int editFABPosition = 20;
  bool isEditingMode = false;
  bool isEditButtonHide = true;
  bool hideAnimationBlocked = false;
  bool queryResult = false;
  void setEditButtonVisibility(bool mode) {
    editFABPosition = mode ? 40 : -80;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args == null) {
      log("args is null");
      return;
    }
    if (args is! ArchCard) {
      log("need ArchCard argument");
      return;
    }
    _archCard = args;
  }

  @override
  Widget build(BuildContext context) {
    final formsEdit = CardFormsEdit(_archCard);
    final formsRead = CardFormsRead(_archCard);
    return GestureDetector(
        onTap: () {
          if (!hideAnimationBlocked && !isEditingMode) {
            setState(() {
              hideAnimationBlocked = true;
              Timer(const Duration(milliseconds: 300),
                  () => hideAnimationBlocked = false);
              isEditButtonHide = !isEditButtonHide;
              setEditButtonVisibility(isEditButtonHide);
            });
          }
        },
        child: Scaffold(
          appBar: AppBar(
              title: isEditingMode
                  ? Text('${_archCard.name} : Редактирование ')
                  : Text('${_archCard.name} : Сводка'),
              actions: isEditingMode
                  ? [
                      //CLOSE BUTTON
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isEditingMode = false;
                          });
                        },
                        icon: const Icon(Icons.close),
                      ),
                      // ACCEPT BUTTON
                      IconButton(
                        onPressed: () async {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const AlertDialog(
                                  title: Text('Сохранение'),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CircularProgressIndicator(),
                                      SizedBox(height: 16.0),
                                      Text('Подождите')
                                    ],
                                  ),
                                );
                              });

                          // queryResult = await connector.editCard(_archCard);
                          Navigator.of(context).pop();
                          // ignore: use_build_context_synchronously
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Сохранение'),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: queryResult
                                        ? const [
                                            Icon(Icons.check_circle,
                                                color: Colors.green, size: 60),
                                            SizedBox(height: 16.0),
                                            Text('Подождите')
                                          ]
                                        : const [
                                            Icon(
                                              Icons.error,
                                              color: Colors.red,
                                              size: 60,
                                            )
                                          ],
                                  ),
                                );
                              });

                          setState(() {
                            formsEdit.updateCard();
                            isEditingMode = false;
                          });
                        },
                        icon: const Icon(Icons.check_sharp),
                      )
                    ]
                  : null),
          // edit button
          floatingActionButton: Stack(children: [
            AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                bottom: editFABPosition.toDouble(),
                right: 20,
                child: FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        editFABPosition = -80;
                        isEditingMode = !isEditingMode;
                        setEditButtonVisibility(false);
                      });
                    },
                    child: const Icon(Icons.edit))),
          ]),
          body: isEditingMode
              ? formsEdit
              : formsRead
          
        ));
  }
}

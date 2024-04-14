import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/card_screen/widgets/card_forms_edit.dart';
import 'package:flutter_application_2/features/card_screen/widgets/card_forms_read.dart';
import 'package:flutter_application_2/features/cards_list/models/card.dart';
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

  int _editFABPosition = 20;
  bool _isEditingMode = false;
  bool _isEditButtonHide = true;
  bool _hideAnimationBlocked = false;

  void setEditButtonVisibility(bool mode) {
    _editFABPosition = mode ? 40 : -80;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args == null) {
      print("args is null");
      return;
    }
    if (args is! ArchCard) {
      print("need ArchCard argument");
      return;
    }
    _archCard = args;
  }

  @override
  Widget build(BuildContext context) {
    final connector = Provider.of<Connector>(context);
    final formsEdit = CardFormsEdit(_archCard);
    final formsRead = CardFormsRead(_archCard);
    return GestureDetector(
        onTap: () {
          setState(() {
            if (!_hideAnimationBlocked && !_isEditingMode) {
              _hideAnimationBlocked = true;
              Timer(const Duration(milliseconds: 300),
                  () => _hideAnimationBlocked = false);
              _isEditButtonHide = !_isEditButtonHide;
              setEditButtonVisibility(_isEditButtonHide);
            }
          });
        },
        child: Scaffold(
          appBar: AppBar(
              title: _isEditingMode
                  ? Text('${_archCard.name} : Редактирование ')
                  : Text('${_archCard.name} : Сводка'),
              actions: _isEditingMode
                  ? [
                      //CLOSE BUTTON
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _isEditingMode = false;
                          });
                        },
                        icon: const Icon(Icons.close),
                      ),
                      // accept editions
                      IconButton(
                        onPressed: () {
                          setState(() {
                            formsEdit.updateCard();
                            var res = connector.editCard(_archCard);
                            _isEditingMode = false;
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
                bottom: _editFABPosition.toDouble(),
                right: 20,
                child: FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        _editFABPosition = -80;
                        _isEditingMode = !_isEditingMode;
                        setEditButtonVisibility(false);
                      });
                    },
                    child: const Icon(Icons.edit))),
          ]),
          body: _isEditingMode ? formsEdit : formsRead,
        ));
  }
}

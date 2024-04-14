import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          ),
          const ListTile(leading: Icon(Icons.person_rounded), title: Text('Личный кабинет'))
        ],
      )),
    );
  }
}

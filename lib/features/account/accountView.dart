


import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/side_menu/side_menu.dart';

class AccountView extends StatefulWidget{
  AccountView({super.key});
  var account = User();

  @override
  State<StatefulWidget> createState() => _AccountViewState();
}

class User {
}

class _AccountViewState extends State<AccountView>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Личный кабинет')),drawer: const SideMenu(),body: Column(),);
  }

}
import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/side_menu/side_menu.dart';
import 'package:flutter_application_2/repositories/user/models/user.dart';
import 'package:flutter_application_2/repositories/authorization/authorize_repository.dart';
import 'package:get_it/get_it.dart';

class AccountView extends StatefulWidget {
  AccountView({super.key});

  @override
  State<StatefulWidget> createState() => _AccountViewState();
}


class _AccountViewState extends State<AccountView> {
  User? user;
  @override
  void initState() {
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Личный кабинет')),
      body: Center(
          child: Padding(
              padding: EdgeInsets.only(top: 40),
              child: Column(
                
                children: [
                  Icon(
                    Icons.account_circle,
                    size: 200,
                  ), 
                  Text(user!.login??''),
                  row('Имя', user!.name??''),
                  row('Фамилия', user!.surname??''),
                  row('Организация', user!.organization??''),
                  
                ],
              ))),
    );
  }

  Widget row(String label, String data){
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text("$label : "), Text(data)],);
}

}



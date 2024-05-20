import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/authorization/authorization_screen.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
          child: GestureDetector(
              onTap: () {},
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top),
                  ),
                  ListTile(
                    leading: const Icon(Icons.person_rounded),
                    title: const Text('Личный кабинет'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('Выход'),
                    onTap: (){
                      Navigator.of(context).pushReplacement<void,void>(
                                    MaterialPageRoute(builder: (context) {
                                      return AuthorizationScreen();
                                    }));
                    },
                  ),
                ],
              ))),
    );
  }
}

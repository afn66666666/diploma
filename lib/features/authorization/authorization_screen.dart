import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/cards_list/views/cards_list.dart';
import 'package:flutter_application_2/features/sql_connection/connector.dart';
import 'package:provider/provider.dart';
import 'package:crypto/crypto.dart';

class AuthorizationScreen extends StatefulWidget {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  AuthorizationScreen({super.key});
  @override
  State<StatefulWidget> createState() => AuthorizationScreenState();
}

class AuthorizationScreenState extends State<AuthorizationScreen> {
  bool _showError = false;
  bool isPasswordHidden = true;
  bool _isLoadingShow = false;
  String _error = '';
  @override
  Widget build(BuildContext context) {
    print('authorization screen builded');
    final connector = Provider.of<Connector>(context);
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text(
          'Авторизация',
          style: TextStyle(color: Colors.purple),
        ),
        //login
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            controller: widget._loginController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: 'Логин',
              labelStyle: TextStyle(color: theme.appBarTheme.backgroundColor),
            ),
          ),
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
        //password
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              obscureText: isPasswordHidden,
              controller: widget._passwordController,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isPasswordHidden = !isPasswordHidden;
                      });
                    },
                    icon: Icon(isPasswordHidden
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined),
                    color: theme.appBarTheme.backgroundColor,
                  ),
                  border: const OutlineInputBorder(),
                  labelText: 'Пароль',
                  labelStyle:
                      TextStyle(color: theme.appBarTheme.backgroundColor)),
            )),
        Container(
            child: _isLoadingShow
                ? const Padding(
                    padding: EdgeInsets.all(70),
                    child: Column(children: [
                      SizedBox(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator(
                            strokeWidth: 8,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Вход в систему...',
                        style: TextStyle(color: Colors.purple),
                      )
                    ]),
                  )
                : Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: _showError
                              ? Text(
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize:
                                          theme.textTheme.bodySmall?.fontSize ??
                                              16),
                                  _error)
                              : null),
                      // TextButton(
                      //   style: ButtonStyle(backgroundColor: ),
                      //   onPressed: () async => authorizing(connector),
                      //   child: const Text('Войти'),
                      // ),
                      ElevatedButton(
                        onPressed: () => authorizing(connector),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(4.0), // скругление углов
                          ),
                        ),
                        child: Text(
                          'Войти',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white, // цвет текста
                          ),
                        ),
                      )
                    ],
                  ))
      ]),
    );
  }

  void authorizing(Connector connector) async {
    final login = widget._loginController.text;
    final password = widget._passwordController.text;
    if (login.isEmpty || password.isEmpty) {
      setState(() {
        _showError = true;
        _error = 'Поля не могут быть пустыми';
      });
    } else {
      final hash = sha512.convert(utf8.encode(password)).toString();
      setState(() => _isLoadingShow = true);
      var res = await connector.authorize(login, hash);
      if (res) {
        // ignore: use_build_context_synchronously
        Navigator.of(context)
            .pushReplacement<void, void>(MaterialPageRoute(builder: (context) {
          return const CardsScreen();
        }));
      } else {
        setState(
          () {
            _isLoadingShow = false;
            _showError = true;
            _error = 'Логин или пароль введен неверно';
          },
        );
      }
    }
  }
}

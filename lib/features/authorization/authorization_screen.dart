import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
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
  bool _isPasswordVisible = false;
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
        Text(
          'Авторизация',
          style: theme.appBarTheme.titleTextStyle,
        ),
        //login
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            controller: widget._loginController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              // enabledBorder: OutlineInputBorder(
              //     borderSide: BorderSide(
              //         color: Colors.black54, width: 3, style: BorderStyle.none)),
              // disabledBorder: OutlineInputBorder(
              //     borderSide: BorderSide(
              //         color: Colors.black54, width: 3, style: BorderStyle.none)),
              // border: OutlineInputBorder(
              //     borderSide: BorderSide(color: Colors.white, width: 3,style: BorderStyle.none)),
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
              obscureText: _isPasswordVisible,
              controller: widget._passwordController,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                    icon: Icon(_isPasswordVisible
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
                ? const CircularProgressIndicator()
                : Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: _showError
                              ? Text(
                                  style: TextStyle(color: Colors.red,fontSize: theme.textTheme.bodySmall?.fontSize ?? 16),
                                  _error)
                              : null),
                      TextButton(
                        onPressed: () async {
                          final login = widget._loginController.text;
                          final password = widget._passwordController.text;
                          if (login.isEmpty || password.isEmpty) {
                            setState(() {
                              _showError = true;
                              _error = 'Поля не могут быть пустыми';
                            });
                          }
                          else{
                          final hash =
                              sha512.convert(utf8.encode(password)).toString();
                          setState(() => _isLoadingShow = true);
                          _showError = await connector.authorize(login, hash);
                          var test = connector.authorize(login, hash);
                          test.then((res) {
                            if (res) {
                              Navigator.of(context).pushNamed('/card_screen');
                            } else {
                              setState(
                                () {
                                  _isLoadingShow = false;
                                  _showError = true;
                                  _error = 'Логин или пароль введен неверно';
                                },
                              );
                            }
                          });
                          }
                        },
                        child: const Text('Войти'),
                      ),
                    ],
                  ))
      ]),
      // Container(
      //   child: _isLoadingShow
      //       ? Container(
      //           margin:
      //               EdgeInsets.symmetric(horizontal: 90, vertical: 350),
      //           alignment: Alignment.center,
      //           color: Colors.amber,
      //           child: const Text('kmkm'),
      //         )
      //       : null,
      // ),
    );
  }
}

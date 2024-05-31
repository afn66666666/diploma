import 'dart:convert';
import 'dart:developer';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/authorization/bloc/authorization_bloc.dart';
import 'package:flutter_application_2/features/cards_list/view/cards_list.dart';
import 'package:flutter_application_2/repositories/authorization/authorize_repository.dart';
import 'package:flutter_application_2/repositories/user/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class AuthorizationScreen extends StatefulWidget {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  AuthorizationScreen({super.key});
  @override
  State<StatefulWidget> createState() => AuthorizationScreenState();
}

class AuthorizationScreenState extends State<AuthorizationScreen> {
  AuthorizationBloc _authorizationBloc =
      AuthorizationBloc(GetIt.I<AuthorizeRepository>());
  bool isPasswordHidden = true;
  String _error = '';


  @override
  Widget build(BuildContext context) {
    log('authorization screen builded');
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
        BlocListener<AuthorizationBloc, AuthorizationState>(
          bloc: _authorizationBloc,
          listener: (context, state) {
            if (state is SuccessAuthorized) {
              GetIt.I.registerSingleton(UserRepository(state.user));
              Navigator.of(context).pushReplacement<void, void>(
                  MaterialPageRoute(builder: (context) {
                return CardsList();
              }));
            }
          },
          child: Container(),
        ),
        Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: BlocBuilder<AuthorizationBloc, AuthorizationState>(
                  bloc: _authorizationBloc,
                  builder: (context, state) {
                    final authorizeButton = TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(5.0), // скругление углов
                        ),
                      ),
                      onPressed: () {
                        var hash = sha512
                            .convert(
                                utf8.encode(widget._passwordController.text))
                            .toString();
                        _authorizationBloc.add(Authorize(
                            login: widget._loginController.text,
                            password: hash));
                      },
                      child: const Text(
                        'Войти',
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                    );
                    if (state is AuthorizationInitial) {
                      return authorizeButton;
                    }
                    if (state is LoadingAuthorization) {
                      return const CircularProgressIndicator();
                    }
                    // if (state is AuthorizationSuccessful) {

                    // }
                    if (state is FailedAuthorized) {
                      return Column(children: [
                        const Text(
                          'Неверный логин или пароль',
                          style: TextStyle(color: Colors.red, fontSize: 18),
                        ),
                        authorizeButton
                      ]);
                    }
                    return authorizeButton;
                  },
                ))
          ],
        )
      ]),
    );
  }
}

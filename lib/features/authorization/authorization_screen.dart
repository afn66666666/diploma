import 'package:flutter/material.dart';

class AuthorizationScreen extends StatefulWidget {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  AuthorizationScreen({super.key});
  @override
  State<StatefulWidget> createState() => AuthorizationScreenState();
}

class AuthorizationScreenState extends State<AuthorizationScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.appBarTheme.backgroundColor,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          'Авторизация',
          style: theme.appBarTheme.titleTextStyle,
        ),
        //login
        TextFormField(
          
          controller: widget._loginController,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.only(left:50, right: 20),
            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.white, width: 3, style: BorderStyle.none)),
            disabledBorder: OutlineInputBorder(borderSide: BorderSide(
                    color: Colors.white, width: 3, style: BorderStyle.none)),
            // border: OutlineInputBorder(
            //     borderSide: BorderSide(color: Colors.white, width: 3,style: BorderStyle.none)),
            labelText: 'Логин',
            labelStyle: TextStyle(color: Colors.white),
          ),
        ),
        //password
        TextFormField(
          controller: widget._passwordController,
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Пароль',
              labelStyle: TextStyle(color: Colors.white)),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('Войти'),
        )
      ]),
    );
  }
}

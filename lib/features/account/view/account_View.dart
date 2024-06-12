import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/account/bloc/account_bloc.dart';
import 'package:flutter_application_2/features/side_menu/side_menu.dart';
import 'package:flutter_application_2/repositories/user/models/user.dart';
import 'package:flutter_application_2/repositories/authorization/authorize_repository.dart';
import 'package:flutter_application_2/repositories/user/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class AccountView extends StatefulWidget {
  AccountView({super.key});

  @override
  State<StatefulWidget> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  final _accountBloc = AccountBloc(GetIt.I<UserRepository>());
  final _user = GetIt.I<UserRepository>().user;
  @override
  void initState() {
    _accountBloc.add(LoadUserViewData());
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
                  Text(_user.login),
                  BlocBuilder<AccountBloc, AccountState>(
                    bloc: _accountBloc,
                    builder: (context, state) {
                      if (state is LoadingAddData) {
                        return const CircularProgressIndicator();
                      } else if (state is SuccessLoadedAddData) {
                        return Column(
                          children: [
                            row('Имя', _user.name),
                            row('Фамилия', _user.surname),
                            row('Статус', 'Администратор'),
                            const Text('Организация'),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                    state.viewData['organization'].toString())),
                            // state.viewData['organization'] ??
                            //     'Ошибка получения данных'),
                          ],
                        );
                      } else {
                        return const Text('Ошибка загрузки');
                      }
                    },
                  ),
                ],
              ))),
    );
  }

  Widget row(String label, String data) {
    return Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$label : "),
            TextFormField(
              initialValue: data,
              readOnly: true,
            )
          ],
        ));
  }
}

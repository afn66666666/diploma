import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/account/view/accountView.dart';
import 'package:flutter_application_2/features/authorization/view/authorization_screen.dart';
import 'package:flutter_application_2/features/card_addition/card_add_screen.dart';
import 'package:flutter_application_2/features/card_screen/card_screen.dart';
import 'package:flutter_application_2/features/main_menu/presentation/widgets/cards_list.dart';
import 'package:flutter_application_2/features/defs.dart';
import 'package:flutter_application_2/features/splash_screen/splash_screen.dart';
import 'package:flutter_application_2/features/sql_connection/connector.dart';
import 'package:provider/provider.dart';

class MCSApp extends StatelessWidget {
  const MCSApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Archeology Cards Storage',
      theme: ThemeData(
        dividerColor: Colors.purple.shade200,
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.purple,
            titleTextStyle: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 23),
            iconTheme: IconThemeData(color: Colors.white)),
        textTheme: const TextTheme(
            bodySmall: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
            bodyMedium: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
            labelSmall: TextStyle(
                color: Color.fromARGB(255, 53, 52, 52),
                fontWeight: FontWeight.w700,
                fontSize: 14)),
      ),
      routes: {
        // '/' : (context){
        //   return SplashScreen();
        // },
        '/': (context) {
          return isAuthorizationEnabled
              ? AuthorizationScreen()
              : CardsList();
        },
        '/card_screen': (context) => const CardScreen(),
        '/add_card': (context) => CardAddScreen(),
        '/account' : (context) => AccountView()
      },
    );
  }
}

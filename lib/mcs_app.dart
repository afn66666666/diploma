import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/account/view/account_view.dart';
import 'package:flutter_application_2/features/authorization/view/authorization_screen.dart';
import 'package:flutter_application_2/features/card_addition/card_add_view.dart';
import 'package:flutter_application_2/features/card/card_view.dart';
import 'package:flutter_application_2/features/cards_list/bloc/cards_list_bloc.dart';
import 'package:flutter_application_2/features/cards_list/view/cards_list.dart';
import 'package:flutter_application_2/features/defs.dart';
import 'package:flutter_application_2/features/excavation_map/excavations_map_view.dart';
import 'package:flutter_application_2/features/excavation_map/map_point.dart';
import 'package:flutter_application_2/features/excavation_map/views/object_excavation_view.dart';
import 'package:flutter_application_2/features/request/requests_view.dart';
import 'package:flutter_application_2/features/splash_screen/splash_screen.dart';
import 'package:flutter_application_2/repositories/cards_list/models/card.dart';

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
        '/': (context) {
          return isAuthorizationEnabled
              ? AuthorizationScreen()
              : CardsList();
        },
        '/object_excavation_map' : (context)=>ObjectExcavationView(point: ModalRoute.of(context)?.settings.arguments as MapPoint),
        '/excavations_map' : (context)=> ExcavationsMapView(),
        '/card_screen': (context) => const CardScreen(),
         '/add_card': (context) => CardAddScreen(cardsListBloc: ModalRoute.of(context)?.settings.arguments as CardsListBloc,),
        '/account' : (context) => AccountView(),
        '/requests' : (context)=> RequestsView(),
      },
    );
  }
}

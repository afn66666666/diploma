import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/card_screen/card_screen.dart';
import 'package:flutter_application_2/features/sql_connection/connector.dart';
import 'package:flutter_application_2/features/side_menu/side_menu.dart';
import 'package:provider/provider.dart';
import 'features/cards_list/views/card_tile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Connector(),
        child: MaterialApp(
          title: 'Archeology Cards Storage',
          theme: ThemeData(
            dividerColor: Colors.purple.shade200,
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.purple,
                titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 23),
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
            '/': (context) => const CardsScreen(),
            '/card_screen': (context) => const CardScreen(),
            '/add_card': (context) => const CardScreen()
          },
        ));
  }
}

class CardsScreen extends StatefulWidget {
  const CardsScreen({super.key});

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  bool _isFloatingButtonShow = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final connector = Provider.of<Connector>(context);
    final cards =
        connector.map.entries.map((iterator) => iterator.value).toList();
    if (!connector.connected) {
      return const Scaffold(
          body: Center(
        child: CircularProgressIndicator(),
      ));
    } else {
      return Scaffold(
            drawer: const SideMenu(),
            //add card button.
            floatingActionButton: Stack(children: [
              AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  bottom: _isFloatingButtonShow ? 20 : -80,
                  right: 20,
                  child: FloatingActionButton(
                      onPressed: () {
                      },
                      child: const Icon(Icons.add))),
            ]),
            appBar: AppBar(
              title: const Text('ACS'),
              actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.sort))],
            ),
            body: GestureDetector(onTap: () {
            setState(() {
              _isFloatingButtonShow = !_isFloatingButtonShow;
            });
          },child: Center(
                child: ListView.separated(
                    itemCount: 10,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, i) {
                      if (i < cards.length) {
                        return CardTile(card: cards[i]);
                      }
                    })),
      ));
    }
  }
}


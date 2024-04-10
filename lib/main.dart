import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/card_screen.dart';
import 'package:flutter_application_2/connector.dart';
import 'package:provider/provider.dart';
import 'card_tile.dart';

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
                    color: Colors.white, fontWeight: FontWeight.bold,
                    fontSize: 23),
                    iconTheme: IconThemeData(color: Colors.white)
                    ),
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
            '/card_screen': (context) => CardScreen(),
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
  _CardsScreenState();
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final connector = Provider.of<Connector>(context);
    if (!connector.connected) {
      return const Scaffold(
          body: Center(
        child: CircularProgressIndicator(),
      ));
    } else {
      final cards = connector.cards;
      return Scaffold(
        appBar: AppBar(
          title: const Text('ACS'),
        ),
        body: Center(
            child: ListView.separated(
                itemCount: 10,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, i) {
                  if (i < cards.length) {
                    
                    return CardTile(card: cards[i]);
                  }
                })),
      );
    }
  }
}



import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/sql_connection/connector.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  
  
  @override
  State<StatefulWidget> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen>{
  @override
  Widget build(BuildContext context) {
    final connector = Provider.of<Connector>(context);
    connector.initConnection();
    
    return Container(color: Colors.purple, child : const CircularProgressIndicator());
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/excavation_map/map_point.dart';
import 'package:flutter_application_2/features/excavation_map/map_screen.dart';

class ObjectExcavationView extends StatelessWidget {
  MapPoint point;
  ObjectExcavationView({required this.point});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Место обнаружения')),
      body:Center(child: MapScreen.single(point: point)),);
  }
}

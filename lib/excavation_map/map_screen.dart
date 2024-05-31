import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/excavation_map/map_point.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapScreen extends StatefulWidget {
  final Map<String, dynamic> rawGeoData;
  MapScreen({super.key, required this.rawGeoData}) {}

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late final YandexMapController _mapController;
  var points = <MapPoint>[];

  @override
  void initState() {
    var la = double.parse(widget.rawGeoData['geo_lat']);
    var lo = double.parse(widget.rawGeoData['geo_lon']);
    points = [MapPoint(name: widget.rawGeoData['result'], latitude: la, longitude: lo)];
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Место раскопок объекта')),
      body:
	//   Container() 
	  YandexMap(
        onMapCreated: (controller) async {
          _mapController = controller;
          if (points.length == 1) {
            await _mapController.moveCamera(CameraUpdate.newCameraPosition(
                CameraPosition(
                    target: Point(
                        latitude: points[0].latitude,
                        longitude: points[0].longitude))));
          } else {
            await _mapController.moveCamera(
              CameraUpdate.newCameraPosition(
                const CameraPosition(
                  target: Point(
                    latitude: 50,
                    longitude: 20,
                  ),
                  zoom: 3,
                ),
              ),
            );
          }
        },
        mapObjects: _getPlacemarkObjects(context),
      ),
    );
  }

  /// Метод для генерации объектов маркеров для отображения на карте
  List<PlacemarkMapObject> _getPlacemarkObjects(BuildContext context) {
    return points
        .map(
          (point) => PlacemarkMapObject(
            mapId: MapObjectId('MapObject $point'),
            point: Point(latitude: point.latitude, longitude: point.longitude),
            opacity: 1,
            icon: PlacemarkIcon.single(
              PlacemarkIconStyle(
                image: BitmapDescriptor.fromAssetImage(
                  'assets/icons/map_marker.png',
                ),
                scale: 0.1,
              ),
            ),
            onTap: (_, __) => showModalBottomSheet(
              context: context,
              builder: (context) => _ModalBodyView(
                point: point,
              ),
            ),
          ),
        )
        .toList();
  }
}

// Метод для генерации точек на карте
List<MapPoint> _getMapPoints() {
  return const [
    MapPoint(name: 'Москва', latitude: 55.755864, longitude: 37.617698),
    MapPoint(name: 'Лондон', latitude: 51.507351, longitude: -0.127696),
    MapPoint(name: 'Рим', latitude: 41.887064, longitude: 12.504809),
    MapPoint(name: 'Париж', latitude: 48.856663, longitude: 2.351556),
    MapPoint(name: 'Стокгольм', latitude: 59.347360, longitude: 18.341573),
  ];
}

/// Содержимое модального окна с информацией о точке на карте
class _ModalBodyView extends StatelessWidget {
  const _ModalBodyView({required this.point});

  final MapPoint point;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text(point.name, style: const TextStyle(fontSize: 20)),
        const SizedBox(height: 20),
        Text(
          '${point.latitude}, ${point.longitude}',
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ]),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/excavation_map/map_point.dart';
import 'package:flutter_application_2/repositories/excavations/models/excavation.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapScreen extends StatefulWidget {
  List<Excavation>? excavations;
  MapPoint? point;
  MapScreen.list({super.key, required this.excavations});
  MapScreen.single({super.key, required this.point});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late final YandexMapController _mapController;
  var points = <MapPoint>[];

  @override
  void initState() {
    if (widget.excavations == null) {
      points.add(
          widget.point ?? MapPoint(name: "", latitude: 50, longtitude: 20));
    } else {
      for (final exc in widget.excavations ?? []) {
        final latitude = double.parse(exc.geodata['geo_lat']);
        final longtitude = double.parse(exc.geodata['geo_lon']);
        points.add(MapPoint(
            name: exc.description, latitude: latitude, longtitude: longtitude));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    //   Container()
    return YandexMap(
      onMapCreated: (controller) async {
        _mapController = controller;
        if (points.length == 1) {
          await _mapController.moveCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                  target: Point(
                      latitude: points[0].latitude,
                      longitude: points[0].longtitude))));
        } else {
          await _mapController.moveCamera(
            CameraUpdate.newCameraPosition(
              const CameraPosition(
                target: Point(
                  latitude: 60,
                  longitude: 35,
                ),
                zoom: 5,
              ),
            ),
          );
        }
      },
      mapObjects: _getPlacemarkObjects(context),
    );
  }

  /// Метод для генерации объектов маркеров для отображения на карте
  List<PlacemarkMapObject> _getPlacemarkObjects(BuildContext context) {
    return points
        .map(
          (point) => PlacemarkMapObject(
              mapId: MapObjectId('MapObject $point'),
              point:
                  Point(latitude: point.latitude, longitude: point.longtitude),
              opacity: 1,
              icon: PlacemarkIcon.single(
                PlacemarkIconStyle(
                  image: BitmapDescriptor.fromAssetImage(
                    'assets/icons/map_marker.png',
                  ),
                  scale: 0.1,
                ),
              ),
              onTap: (_, __) {
                if (points.length > 1) {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => _ModalBodyView(
                      point: point,
                      isSingleMap: false,
                    ),
                  );
                } else {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => _ModalBodyView(
                      point: point,
                      isSingleMap: true,
                    ),
                  );
                }
              }),
        )
        .toList();
  }
}

/// Содержимое модального окна с информацией о точке на карте
class _ModalBodyView extends StatelessWidget {
  const _ModalBodyView({required this.point, required this.isSingleMap});

  final MapPoint point;
  final bool isSingleMap;

  @override
  Widget build(BuildContext context) {
    if (isSingleMap) {
      return showExcavationData();
    } else {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          showExcavationData(),
          Center(
              child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.purple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0), // скругление углов
              ),
            ),
            child: Text(
              'Показать находки',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {},
          )),
        ],
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(point.name, style: const TextStyle(fontSize: 20))),
        const SizedBox(height: 20),
        Text(
          '${point.latitude}, ${point.longtitude}',
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.purple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0), // скругление углов
            ),
          ),
          child: Text(
            'Показать находки',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {},
        ),
      ]),
    );
  }

  Widget showExcavationData() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(point.name, style: const TextStyle(fontSize: 20))),
        const SizedBox(height: 20),
        Text(
          '${point.latitude}, ${point.longtitude}',
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ]),
    );
  }
}

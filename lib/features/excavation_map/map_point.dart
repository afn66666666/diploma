import 'package:equatable/equatable.dart';


/// Модель точки на карте
class MapPoint extends Equatable {
 const MapPoint({
   required this.name,
   required this.latitude,
   required this.longtitude,
 });


 /// Название населенного пункта
 final String name;


 /// Широта
 final double latitude;


 /// Долгота
 final double longtitude;


 @override
 List<Object?> get props => [name, latitude, longtitude];
}
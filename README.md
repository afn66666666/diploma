# Archeology Card Storage (ACS)

ACS - мобильное кроссплатформенное приложение, созданное для работы с цифровыми версиями паспортов музейных объектов Археологического Музея Воронежского Государственного Университета.
***
Приложение разработано при помощи языка программирования Dart и фреймворка Flutter. Для архитектурного разделения бизнес-логики и отображения виджетов использовалась библиотека BLoC. Полный список зависимостей от сторонних библиотек приведен ниже: 
+ [get_it: ^7.7.0](https://pub.dev/packages/get_it)
+ [postgres: ^3.1.2](https://pub.dev/packages/postgres)
+ [passwordfield: ^0.2.0](https://pub.dev/packages/passwordfield)
+  [image_picker: ^1.0.8](https://pub.dev/packages/image_picker)
+  [get: ^4.6.6](https://pub.dev/packages/get)
+  [http: ^1.2.0](https://pub.dev/packages/http)
+  [flutter_bloc: ^8.1.5](https://pub.dev/packages/flutter_bloc)
+  [intl: ^0.19.0](https://pub.dev/packages/intl)
+  [geolocator: ^11.1.0](https://pub.dev/packages/geolocator)
+  [yandex_mapkit: ^4.0.2](https://pub.dev/packages/yandex_mapkit)
+  [equatable: ^2.0.5](https://pub.dev/packages/equatable)
+  [uuid: ^4.4.0](https://pub.dev/packages/uuid)
___
### Пререквизиты
+ Visual Studio Code
+ Android Studio (эмулятор)
+ Dart SDK version: 3.2.6
+ Flutter 3.16.9
_____
### Запуск проекта
После клонирования репозитория необходимо выполнить установку всех зависимостей. Для этого необходимо ввести в консоль команду 
```
flutter pub get
```
Произойдет обработка файла pubspec.yaml, за ней начнется этап разрешения зависимостей и установка необходимых для приложения пакетов. Вывод должен выглядеть следующим образом
```
Resolving dependencies...
flutter_bloc 8.1.5 (8.1.6 available)
  flutter_lints 2.0.3 (4.0.0 available)
  ...
  ...
  Got dependencies!
```
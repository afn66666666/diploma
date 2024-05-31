import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  final nameController = TextEditingController();
  final placementController = TextEditingController();
  final Function setParameter;
  final Function removeParameter;
  SearchView(
      {super.key, required this.setParameter, required this.removeParameter});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textFieldDecoration = InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        border: const OutlineInputBorder(),
        labelStyle: TextStyle(color: theme.appBarTheme.backgroundColor));
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Align(
                widthFactor: 8,
                alignment: Alignment.topLeft,
                child: Text(
                  'Наименование объекта',
                  textAlign: TextAlign.start,
                )),
            TextFormField(
                controller: nameController, decoration: textFieldDecoration),
            const Align(
                widthFactor: 8,
                alignment: Alignment.topLeft,
                child: Text(
                  'Расположение',
                  textAlign: TextAlign.start,
                )),
            TextFormField(
                controller: placementController,
                decoration: textFieldDecoration),
            ElevatedButton(
              onPressed: () {
                removeParameter('name');
                Navigator.of(context).pop();
                // Действие при нажатии на кнопку
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple.shade400,
                // Цвет фона кнопки
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(4.0), // Радиус закругления углов
                ),
              ),
              child: const Text(
                'Сбросить фильтры', // Текст на кнопке
                style: TextStyle(
                  color: Colors.white, // Цвет текста
                  fontSize: 16.0, // Размер шрифта
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty) {
                  setParameter('name', nameController.text);
                }
                if (placementController.text.isNotEmpty) {
                  setParameter('placement', placementController.text);
                }
                Navigator.of(context).pop();
                // Действие при нажатии на кнопку
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                // Цвет фона кнопки
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(4.0), // Радиус закругления углов
                ),
              ),
              child: const Text(
                'Поиск', // Текст на кнопке
                style: TextStyle(
                  color: Colors.white, // Цвет текста
                  fontSize: 16.0, // Размер шрифта
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

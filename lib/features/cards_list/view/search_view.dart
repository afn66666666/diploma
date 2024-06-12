import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/card_addition/date_picker.dart';

class SearchView extends StatelessWidget {
  final nameController = TextEditingController();
  final placementController = TextEditingController();
  final createdDateController = TextEditingController();
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
      appBar: AppBar(title: const Text("Фильтры"),),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: ListView(
          
          children: [
            getTextField('Наименование объекта', theme,nameController),
            getTextField('Автор', theme, null),
            getTextField('Место хранения',theme,placementController),
            getTextField('Описание', theme,null),
            getTextField('Номер регистрации', theme,null),
            DatePicker(label: 'Дата создания (от)', controller: createdDateController,),
            DatePicker(label: 'Дата создания (до)', controller: createdDateController,),
            ElevatedButton(
              onPressed: () {
                removeParameter('name');
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple.shade400,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(4.0),
                ),
              ),
              child: const Text(
                'Сбросить фильтры',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
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
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(4.0), // Радиус закругления углов
                ),
              ),
              child: const Text(
                'Поиск',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getTextField(String label,ThemeData theme, TextEditingController? controller) {
    final textFieldDecoration = InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        border: const OutlineInputBorder(),
        labelStyle: TextStyle(color: theme.appBarTheme.backgroundColor));
    return Column(children: [
      Align(
          widthFactor: 8,
          alignment: Alignment.topLeft,
          child: Text(
            label,
            textAlign: TextAlign.start,
          )),
      TextFormField(
          controller: controller, decoration: textFieldDecoration),
    ]);
  }
}

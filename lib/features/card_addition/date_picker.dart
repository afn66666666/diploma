import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  String label;
  TextEditingController controller;
DatePicker({required this.label, required this.controller});

  @override
  State<StatefulWidget> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  bool _wrongData = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            widget.label,
          ),
          TextField(
            controller: widget.controller,
            onTap: () async {
              var pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1800),
                  lastDate: DateTime(2100));
              if (pickedDate != null) {
                setState(() {
                  // if(pickedDate!.compareTo(DateTime.now()) > 0){
                  //   pickedDate = null;
                  //   _wrongData = true;
                  // }
                widget.controller.text = DateFormat('dd.MM.yyyy').format(pickedDate);
                });
              }
            },
            decoration: const InputDecoration(
              hintText: 'дд.мм.гггг',
              border: OutlineInputBorder(borderSide: BorderSide(width: 4)),
            ),
          )
        ]));
  }
}

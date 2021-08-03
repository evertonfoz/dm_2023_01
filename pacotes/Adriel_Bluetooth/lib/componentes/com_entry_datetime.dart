import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ComEntryDateTime extends StatefulWidget {

  @required
  final Function callBack;
  @required
  final DateTime initialValue;

  ComEntryDateTime({this.callBack, this.initialValue});

  @override
  _ComEntryDateTimeState createState() => _ComEntryDateTimeState();
}

class _ComEntryDateTimeState extends State<ComEntryDateTime> {
  @override
  Widget build(BuildContext context) {
    return DateTimeField(
      initialValue: widget.initialValue == null ? DateTime.now() : widget.initialValue,
      format: DateFormat("dd-MM-yyyy HH:mm"),
      onShowPicker: (context, currentValue) async {
        final date = await showDatePicker(
            fieldHintText: DateTime.now().toString(),
            context: context,
            firstDate: DateTime(1900),
            initialDate: currentValue ?? DateTime.now(),
            lastDate: DateTime(2100)
        );
                          
        if (date != null) {
          final time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
          );
          widget.callBack(DateTimeField.combine(date, time));
          return DateTimeField.combine(date, time);
        } else {
            return currentValue;
        }
      },
    );
  }
}
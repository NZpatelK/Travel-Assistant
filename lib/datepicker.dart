import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  final String title;
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateChanged;

  const DatePicker({
    super.key,
    required this.title,
    required this.selectedDate,
    required this.onDateChanged,
  });

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 10),
          child: TextField(
            controller: _dateController,
            decoration: InputDecoration(
              labelText: widget.title,
              filled: true,
              fillColor: Colors.white,
              prefixIcon: const Icon(Icons.calendar_today),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blueGrey.shade800,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.blue,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            readOnly: true,
            onTap: () {
              _selectDate();
            },
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (_picked != null) {
      setState(() {
        _dateController.text = DateFormat('dd/MM/yyyy').format(_picked);
        widget.onDateChanged(_picked);
      });
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DestinationInput extends StatefulWidget {
  final String inputType;
  final String label;
  final ValueChanged<String?> inputChanged;

  const DestinationInput(
      {super.key,
      required this.inputType,
      required this.label,
      required this.inputChanged});

  @override
  State<DestinationInput> createState() => _DestinationInputState();
}

class _DestinationInputState extends State<DestinationInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType:
          widget.inputType == "num" ? TextInputType.number : TextInputType.text,
      inputFormatters: widget.inputType == "num"
          ? <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              FilteringTextInputFormatter.digitsOnly,
            ]
          : null,
      decoration: InputDecoration(
        labelText: widget.label,
        filled: true,
        fillColor: Colors.white,
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
      onChanged: (value) {
        widget.inputChanged(value);
      },
    );
  }
}

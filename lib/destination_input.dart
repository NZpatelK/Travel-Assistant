import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DestinationInput extends StatefulWidget {
  final String InputType;
  final String Label;

  const DestinationInput({
    super.key,
    required this.InputType,
    required this.Label,
  });

  @override
  State<DestinationInput> createState() => _DestinationInputState();
}

class _DestinationInputState extends State<DestinationInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType:
          widget.InputType == "num" ? TextInputType.number : TextInputType.text,
      inputFormatters: widget.InputType == "num"
          ? <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              FilteringTextInputFormatter.digitsOnly,
            ]
          : null,
      decoration: InputDecoration(
        labelText: widget.Label,
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
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/options_v2.dart';

class SelectBox extends StatefulWidget {
  final List<String> items;
  final String selectedValue;
  final ValueChanged<String?> onChanged;
  final String titleLabel;
  final String headerLabel;
  final bool? isShowSnackBar;

  const SelectBox(
      {super.key,
      required this.items,
      required this.selectedValue,
      required this.onChanged,
      required this.titleLabel,
      required this.headerLabel,
      this.isShowSnackBar});

  @override
  State<SelectBox> createState() => _SelectBoxState();
}

class _SelectBoxState extends State<SelectBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.black,
          width: 2.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10), // Adds 10px top padding
            child: Text(
              widget.headerLabel,
              style: const TextStyle(fontSize: 12),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.selectedValue,
                style: const TextStyle(fontSize: 16),
              ),
              OptionsV2(
                items: widget.items,
                selectedValue: widget.selectedValue,
                titleLabel: widget.titleLabel,
                onChanged: (value) {
                  widget.onChanged(value);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

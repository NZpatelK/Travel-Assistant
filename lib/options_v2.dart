import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/widget/button_widget.dart';

class OptionsV2 extends StatefulWidget {
  final List<String> items;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;

  const OptionsV2(
      {super.key,
      required this.items,
      required this.selectedValue,
      required this.onChanged});

  @override
  State<OptionsV2> createState() => _OptionsV2State();
}

class _OptionsV2State extends State<OptionsV2> {
  int index = 0;

  // static List<String> months = [
  //   'January',
  //   'February',
  //   'March',
  //   'April',
  //   'May',
  //   'June',
  //   'July',
  //   'August',
  //   'September',
  //   'October',
  //   'November',
  //   'December'
  // ];

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ButtonWidget(
            onClicked: () => Utils.showSheet(
              context,
              child: buildCustomPicker(),
              onClicked: () {
                final value = widget.items[index];
                Utils.showSnackBar(context, 'Selected "$value"');
                Navigator.pop(context);
              },
            ),
          ),
        ],
      );

  Widget buildCustomPicker() => SizedBox(
        height: 200,
        child: CupertinoPicker(
          itemExtent: 40,
          diameterRatio: 0.8,
          onSelectedItemChanged: (index) => setState(() => this.index = index),
          selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
            background: Colors.blue[500]!.withOpacity(0.12),
          ),
          children: Utils.modelBuilder<String>(
            widget.items,
            (index, value) {
              final isSelected = this.index == index;
              final color = isSelected ? Colors.blue[500] : Colors.black;
              return Center(
                child: Text(
                  value,
                  style: TextStyle(color: color, fontSize: 24),
                ),
              );
            },
          ),
        ),
      );
}

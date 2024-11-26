import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/widget/button_widget.dart';

class CupertinoSelectBox extends StatefulWidget {
  final List<String> items;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;
  final String? titleLabel;
  final bool? isShowSnackBar;

  const CupertinoSelectBox({
    super.key,
    required this.items,
    this.selectedValue,
    required this.onChanged,
    this.titleLabel,
    this.isShowSnackBar,
  });

  @override
  State<StatefulWidget> createState() => _CupertinoSelectBoxState();
}

class _CupertinoSelectBoxState extends State<CupertinoSelectBox> {
  int index = 0;
  
  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ButtonWidget(
            onClicked: () => Utils.showSheet(
              title: widget.titleLabel!,
              context,
              child: buildCustomPicker(),
              onClicked: () {
                final value = widget.items[index];
                widget.onChanged(value);
                if (widget.isShowSnackBar ?? false) {
                  Utils.showSnackBar(context, 'Selected "$value"');
                }
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
          diameterRatio: 1,
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

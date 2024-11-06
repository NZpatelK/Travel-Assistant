import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onClicked;

  const ButtonWidget({
    super.key,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) => CupertinoButton(
        onPressed: (onClicked),
        child:  Text('Change', style: TextStyle(fontSize: 16, color: Colors.blue[500]),),
      );
}

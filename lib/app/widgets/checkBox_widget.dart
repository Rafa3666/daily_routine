import 'package:flutter/material.dart';
import '../models/checkBox_model.dart';

class CheckboxWidget extends StatefulWidget {
  const CheckboxWidget({super.key, required this.item});

  final CheckBoxModel item;

  @override
  _CheckboxWidgetState createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.item.text),
      value: widget.item.checked,
      onChanged: (bool? value) {
        setState(() {
          widget.item.checked = value!;
        });
      },
    );
  }
}

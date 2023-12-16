import 'package:flutter/material.dart';
import 'package:tokoweb_test/constant/app_text.dart';

class DefaultRadioButtonWidget extends StatefulWidget {
  const DefaultRadioButtonWidget(
      {super.key,
      required this.title,
      required this.values,
      this.onChanged,
      required this.selectValue});

  final String title;
  final String values;
  final String selectValue;
  final Function(String?)? onChanged;

  @override
  State<DefaultRadioButtonWidget> createState() =>
      _DefaultRadioButtonWidgetState();
}

class _DefaultRadioButtonWidgetState extends State<DefaultRadioButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: widget.values,
          groupValue: widget.selectValue,
          onChanged: widget.onChanged,
        ),
        Text(
          widget.title,
          style: AppText.text16.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

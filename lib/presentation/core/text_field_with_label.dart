import 'package:flutter/material.dart';

class TextFieldWithLabel extends StatelessWidget {
  const TextFieldWithLabel({
    Key? key,
    required this.fieldKey,
    required this.labelText,
    required this.controller,
    required this.validator,
    required this.onChanged,
    required this.isEnabled,
    required this.decoration,
    required this.textStyleLabel,
    required this.textInputStyle,
    this.autocorrect = true,
    this.keyboardType,
    this.initValue,
    this.obscureText = false,
    this.onDone,
  }) : super(key: key);
  final String fieldKey;
  final String labelText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool autocorrect;
  final Function(String?) validator;
  final Function(String) onChanged;
  final bool isEnabled;
  final String? initValue;
  final InputDecoration decoration;
  final bool obscureText;
  final Function(String)? onDone;
  final TextStyle textStyleLabel;
  final TextStyle textInputStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: textStyleLabel,
        ),
        const SizedBox(height: 4),
        TextFormField(
          key: Key(fieldKey),
          autocorrect: autocorrect,
          enabled: isEnabled,
          controller: controller,
          keyboardType: keyboardType,
          decoration: decoration,
          obscureText: obscureText,
          onChanged: onChanged,
          validator: (value) => validator(value),
          initialValue: initValue,
          onFieldSubmitted: onDone,
          style: textInputStyle,
        ),
      ],
    );
  }
}

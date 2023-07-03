import 'package:flutter/material.dart';

class TextFieldWithLabel extends StatelessWidget {
  const TextFieldWithLabel({
    Key? key,
    required this.fieldKey,
    required this.labelText,
    required this.controller,
    required this.validator,
    required this.onChanged,
    required this.decoration,
    this.isEnabled = true,
    this.autoCorrect = false,
    this.keyboardType,
    this.initValue,
    this.obscureText = false,
    this.onDone,
  }) : super(key: key);
  final Key fieldKey;
  final String labelText;
  final TextEditingController controller;
  final Function(String?) validator;
  final Function(String) onChanged;
  final InputDecoration decoration;
  final bool isEnabled;
  final bool autoCorrect;
  final TextInputType? keyboardType;
  final String? initValue;
  final bool obscureText;
  final Function(String)? onDone;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: Theme.of(context).textTheme.labelSmall,
        ),
        const SizedBox(height: 8),
        TextFormField(
          key: fieldKey,
          style: Theme.of(context).textTheme.titleMedium,
          autocorrect: autoCorrect,
          enabled: isEnabled,
          controller: controller,
          keyboardType: keyboardType,
          decoration: decoration,
          obscureText: obscureText,
          onChanged: onChanged,
          validator: (value) => validator(value),
          initialValue: initValue,
          onFieldSubmitted: onDone,
        ),
      ],
    );
  }
}

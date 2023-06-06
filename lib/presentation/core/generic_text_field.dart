import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class GenericTextField extends StatelessWidget {
  const GenericTextField({
    Key? key,
    required this.fieldKey,
    required this.labelText,
    required this.validator,
    required this.onChanged,
    required this.isEnabled,
    required this.value,
  }) : super(key: key);
  final String fieldKey;
  final String labelText;
  final Function(String?) validator;
  final Function(String?) onChanged;
  final bool isEnabled;
  final String value;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: Key(fieldKey),
      autocorrect: false,
      enabled: isEnabled,
      decoration: InputDecoration(labelText: labelText.tr()),
      onChanged: onChanged,
      validator: (value) => validator(value),
      initialValue: value,
    );
  }
}

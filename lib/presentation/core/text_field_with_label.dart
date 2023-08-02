import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWithLabel extends StatelessWidget {
  const TextFieldWithLabel({
    Key? key,
    required this.fieldKey,
    required this.labelText,
    this.controller,
    this.validator,
    required this.onChanged,
    required this.decoration,
    this.isEnabled = true,
    this.autoCorrect = false,
    this.keyboardType,
    this.initValue,
    this.obscureText = false,
    this.onDone,
    this.maxLines = 1,
    this.mandatory = false,
    this.readOnly = false,
    this.focusNode,
    this.inputFormatters,
    this.onTapOutside,
    this.maxLength,
  }) : super(key: key);
  final Key fieldKey;
  final String labelText;
  final TextEditingController? controller;
  final Function(String?)? validator;
  final Function(String) onChanged;
  final InputDecoration decoration;
  final bool isEnabled;
  final bool autoCorrect;
  final TextInputType? keyboardType;
  final String? initValue;
  final bool obscureText;
  final Function(String)? onDone;
  final int maxLines;
  final bool mandatory;
  final bool readOnly;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final TapRegionCallback? onTapOutside;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: labelText,
            style: Theme.of(context).textTheme.labelSmall,
            children: <TextSpan>[
              if (mandatory)
                TextSpan(
                  text: ' *',
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall
                      ?.copyWith(color: ZPColors.red),
                ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          focusNode: focusNode,
          inputFormatters: inputFormatters,
          key: fieldKey,
          style: Theme.of(context).textTheme.titleMedium,
          autocorrect: autoCorrect,
          enabled: isEnabled,
          controller: controller,
          keyboardType: keyboardType,
          decoration: decoration,
          obscureText: obscureText,
          onChanged: onChanged,
          validator: (value) => validator?.call(value),
          initialValue: initValue,
          onFieldSubmitted: onDone,
          onTapOutside: onTapOutside,
          maxLines: maxLines,
          maxLength: maxLength,
          readOnly: readOnly,
        ),
      ],
    );
  }
}

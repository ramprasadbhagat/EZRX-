import 'dart:math' as math;

import 'package:flutter/services.dart';

class RunesLengthLimitingTextInputFormatter extends TextInputFormatter {
  final int? maxLength;

  RunesLengthLimitingTextInputFormatter(this.maxLength);

  static TextEditingValue truncate(TextEditingValue value, int maxLength) {
    final unTruncatedText = value.text;
    var truncatedText = '';
    if (value.text.runes.length > maxLength) {
      truncatedText = unTruncatedText.substring(0, maxLength);
    }

    return TextEditingValue(
      text: truncatedText,
      selection: value.selection.copyWith(
        baseOffset: math.min(value.selection.start, truncatedText.length),
        extentOffset: math.min(value.selection.end, truncatedText.length),
      ),
      composing: !value.composing.isCollapsed &&
              truncatedText.length > value.composing.start
          ? TextRange(
              start: value.composing.start,
              end: math.min(value.composing.end, truncatedText.length),
            )
          : TextRange.empty,
    );
  }

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final maxLength = this.maxLength;

    if (maxLength == null ||
        maxLength == -1 ||
        newValue.text.runes.length <= maxLength) {
      return newValue;
    }

    assert(maxLength > 0);

    // If already at the maximum and tried to enter even more, and has no
    // selection, keep the old value.
    if (oldValue.text.runes.length == maxLength &&
        oldValue.selection.isCollapsed) {
      return oldValue;
    }

    // Enforced to return a truncated value.
    return truncate(newValue, maxLength);
  }
}

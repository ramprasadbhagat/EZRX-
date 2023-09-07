import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'key_value_pair.freezed.dart';

@freezed
class KeyValuePair with _$KeyValuePair {
  const KeyValuePair._();

  factory KeyValuePair({
    required String key,
    required String value,
    required Key widgetKey,
  }) = _KeyValuePair;

  factory KeyValuePair.empty() => KeyValuePair(
        key: '',
        value: '',
        widgetKey: const ValueKey(''),
      );
}

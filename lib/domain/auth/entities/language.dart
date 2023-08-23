import 'dart:ui';

import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'language.freezed.dart';

@freezed
class Language with _$Language {
  factory Language({
    required Locale subTag,
  }) = _Language;

  factory Language.english() => Language(
        subTag: const Locale(
          ApiLanguageCode.english,
        ),
      );
}

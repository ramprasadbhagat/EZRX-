import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'language.freezed.dart';

@freezed
class Language with _$Language {
  factory Language({
    required LanguageValue subTag,
  }) = _Language;

  factory Language.english() => Language(subTag: LanguageValue('EN'));
}

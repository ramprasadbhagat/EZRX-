import 'dart:ui';

import 'package:ezrxmobile/domain/auth/entities/language.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'language_dto.freezed.dart';
part 'language_dto.g.dart';

@freezed
class LanguageDto with _$LanguageDto {
  LanguageDto._();
  factory LanguageDto({
    @JsonKey(name: 'language', defaultValue: '') required String subTag,
  }) = _LanguageDto;

  factory LanguageDto.fromJson(Map<String, dynamic> json) =>
      _$LanguageDtoFromJson(json);

  Language get toDomain => Language(subTag: Locale(subTag));

  factory LanguageDto.fromDomain(Language language) => LanguageDto(
        subTag: language.subTag.languageCode,
      );
}

import 'package:ezrxmobile/domain/account/entities/setting_aup.dart';
import 'package:ezrxmobile/infrastructure/core/common/dto_helper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_aup_dto.freezed.dart';
part 'setting_aup_dto.g.dart';

@Freezed(toJson: false)
class SettingAupDto with _$SettingAupDto {
  const SettingAupDto._();

  const factory SettingAupDto({
    @JsonKey(name: 'acceptAUP') required bool acceptAUP,
    @JsonKey(name: 'acceptAUPTC', defaultValue: '1970-01-01 00:00:00', readValue: dateTimeStringFormatCheck)
        required String acceptAUPTimestamp,
  }) = _SettingAupDto;

  SettingAup toDomain() {
    return SettingAup(
      acceptAUP: acceptAUP,
      acceptAUPTimestamp: DateTime.parse(acceptAUPTimestamp),
    );
  }

  factory SettingAupDto.fromJson(Map<String, dynamic> json) =>
      _$SettingAupDtoFromJson(json);
}

import 'package:ezrxmobile/domain/account/entities/setting_tc.dart';
import 'package:ezrxmobile/infrastructure/core/common/dto_helper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_tc_dto.freezed.dart';
part 'setting_tc_dto.g.dart';

@Freezed(toJson: false)
class SettingTcDto with _$SettingTcDto {
  const SettingTcDto._();

  const factory SettingTcDto({
    @JsonKey(name: 'acceptTC') required bool acceptTC,
    @JsonKey(name: 'acceptTCTimestamp', defaultValue: '1970-01-01 00:00:00', readValue: dateTimeStringFormatCheck)
        required String acceptTCTimestamp,
  }) = _SettingTcDto;

  SettingTc toDomain() {
    return SettingTc(
      acceptTC: acceptTC,
      acceptTCTimestamp: DateTime.parse(acceptTCTimestamp),
    );
  }

  factory SettingTcDto.fromJson(Map<String, dynamic> json) =>
      _$SettingTcDtoFromJson(json);
}

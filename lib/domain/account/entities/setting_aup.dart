import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_aup.freezed.dart';

@freezed
class SettingAup with _$SettingAup {
  const SettingAup._();

  const factory SettingAup({
    required bool acceptAUP,
    required DateTime acceptAUPTimestamp,
  }) = _SettingAup;

  factory SettingAup.empty() => SettingAup(
        acceptAUP: false,
        acceptAUPTimestamp: DateTime.parse('1970-01-01 00:00:00'),
      );
}

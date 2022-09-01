import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_tc.freezed.dart';

@freezed
class SettingTc with _$SettingTc {
  const SettingTc._();

  const factory SettingTc({
    required bool acceptTC,
    required String acceptTCTimestamp,
  }) = _SettingTc;

  factory SettingTc.empty() => const SettingTc(
        acceptTC: false,
        acceptTCTimestamp: '',
      );
}

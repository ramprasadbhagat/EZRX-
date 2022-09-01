import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_aup.freezed.dart';

@freezed
class SettingAup with _$SettingAup {
  const SettingAup._();

  const factory SettingAup({
    required bool acceptAUP,
    required String acceptAUPTC,
  }) = _SettingAup;

  factory SettingAup.empty() => const SettingAup(
        acceptAUP: false,
        acceptAUPTC: '',
      );
}

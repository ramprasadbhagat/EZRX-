import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_tc.freezed.dart';

@freezed
class SettingTc with _$SettingTc {
  const SettingTc._();

  const factory SettingTc({
   required bool acceptPrivacyPolicy,
    required DateTime acceptPrivacyPolicyTime,
    required String privacyPolicyAcceptedPlatform,
  }) = _SettingTc;

  factory SettingTc.empty() => SettingTc(
        acceptPrivacyPolicy: false,
        acceptPrivacyPolicyTime: DateTime.parse('1970-01-01 00:00:00'),
        privacyPolicyAcceptedPlatform: '',
      );
}

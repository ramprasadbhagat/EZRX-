import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings.freezed.dart';

@freezed
class Settings with _$Settings {
  const Settings._();

  const factory Settings({
    required bool emailNotifications,
    required bool mobileNotifications,
    required String languagePreference,
  }) = _Settings;

  factory Settings.empty() => const Settings(
        emailNotifications: false,
        mobileNotifications: false,
        languagePreference: '',
      );
}

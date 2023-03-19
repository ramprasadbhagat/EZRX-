part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.initialized() = _Initialized;
  const factory UserEvent.fetch() = _Fetch;
  const factory UserEvent.accptTnc({required String date}) = _AccptTnc;
  const factory UserEvent.updateNotificationSettings({
    required LanguageValue languagePreference,
    required bool emailNotifications,
  }) = _UpdateNotificationSettings;
}

part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.initialized() = _Initialized;
  const factory UserEvent.fetch({
    @Default(false) bool isLoginOnBehalf,
  }) = _Fetch;
  const factory UserEvent.acceptTnc() = _AcceptTnc;
  const factory UserEvent.updateNotificationSettings({
    required LanguageValue languagePreference,
    required bool emailNotifications,
  }) = _UpdateNotificationSettings;
  const factory UserEvent.updatePaymentNotificationSettings({
    required PaymentNotification paymentNotification,
  }) = _UpdatePaymentNotificationSettings;
}

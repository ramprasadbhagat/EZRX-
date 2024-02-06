part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.initialized() = _Initialized;
  const factory UserEvent.fetch({
    @Default(false) bool isLoginOnBehalf,
  }) = _Fetch;
  const factory UserEvent.acceptTnc() = _AcceptTnc;
  const factory UserEvent.setMarketPlaceTncAcceptance(
    MarketPlaceTnCAcceptance value,
  ) = _SetMarketPlaceTncAcceptance;
  const factory UserEvent.updateNotificationSettings({
    required Language languagePreference,
    required bool emailNotifications,
  }) = _UpdateNotificationSettings;
  const factory UserEvent.updatePaymentNotificationSettings({
    required PaymentNotification paymentNotification,
  }) = _UpdatePaymentNotificationSettings;
  const factory UserEvent.updateLanguage(Language language) = _UpdateLanguage;
  const factory UserEvent.selectLanguage(Language language) = _SelectLanguage;
}

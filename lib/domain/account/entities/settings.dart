import 'package:ezrxmobile/domain/account/entities/payment_notification.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings.freezed.dart';

@freezed
class Settings with _$Settings {
  const Settings._();

  const factory Settings({
    required bool emailNotifications,
    required bool mobileNotifications,
    required PaymentNotification paymentNotification,
    required LanguageValue languagePreference,
  }) = _Settings;

  factory Settings.empty() => Settings(
        emailNotifications: false,
        mobileNotifications: false,
        paymentNotification: PaymentNotification.empty(),
        languagePreference: LanguageValue(''),
      );
}

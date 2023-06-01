part of 'payment_notification_bloc.dart';

@freezed
class PaymentNotificationEvent with _$PaymentNotificationEvent {
  const factory PaymentNotificationEvent.updatePaymentNotification({
    required PaymentNotification paymentNotification,
  }) = _PaymentNotificationEvent;
  const factory PaymentNotificationEvent.updateAdviceExpiryReminder({
    required PaymentNotification paymentNotification,
    required String day,
    required bool updatedValue,
  }) = _UpdateAdviceExpiryReminder;
}

enum PaymentAdviceType {
  day03,
  day05,
  day07,
}

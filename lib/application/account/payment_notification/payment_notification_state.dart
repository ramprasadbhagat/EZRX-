part of 'payment_notification_bloc.dart';

@freezed
class PaymentNotificationState with _$PaymentNotificationState {
  const PaymentNotificationState._();

  const factory PaymentNotificationState({
    required String message,
    required PaymentNotification paymentNotification,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
  }) = _PaymentNotificationState;

  factory PaymentNotificationState.initial() => PaymentNotificationState(
        message: '',
        paymentNotification: PaymentNotification.empty(),
        failureOrSuccessOption: none(),
      );
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_payment_notification_response.freezed.dart';

@freezed
class UpdatePaymentNotificationResponse
    with _$UpdatePaymentNotificationResponse {
  const UpdatePaymentNotificationResponse._();

  const factory UpdatePaymentNotificationResponse({
    required String message,
  }) = _UpdatePaymentNotificationResponse;

  factory UpdatePaymentNotificationResponse.empty() =>
      const UpdatePaymentNotificationResponse(message: '');
}

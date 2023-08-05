import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

import 'package:ezrxmobile/domain/account/entities/update_payment_notification_response.dart';

import 'package:ezrxmobile/domain/account/entities/payment_notification.dart';

abstract class IUpdatePaymentNotificationRepository {
  Future<Either<ApiFailure, UpdatePaymentNotificationResponse>>
      updatePaymentNotification({
    required PaymentNotification paymentNotification,
  });
}

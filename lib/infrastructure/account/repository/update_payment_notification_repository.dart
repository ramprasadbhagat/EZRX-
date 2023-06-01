import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';

import 'package:ezrxmobile/domain/account/entities/payment_notification.dart';

import 'package:ezrxmobile/domain/account/entities/update_payment_notification_response.dart';

import 'package:ezrxmobile/domain/account/repository/i_update_payment_notification_repository.dart';

import 'package:ezrxmobile/infrastructure/account/datasource/update_payment_notification_local_datasource.dart';

import 'package:ezrxmobile/infrastructure/account/datasource/update_payment_notification_remote_datasource.dart';

import 'package:ezrxmobile/infrastructure/account/dtos/payment_advice_expiry_notification_dto.dart';

class UpdatePaymentNotificationRepository
    implements IUpdatePaymentNotificationRepository {
  final Config config;
  final UpdatePaymentNotificationRemoteDataSource remoteDataSource;
  final UpdatePaymentNotificationLocalDataSource localDataSource;

  UpdatePaymentNotificationRepository({
    required this.config,
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<ApiFailure, UpdatePaymentNotificationResponse>>
      updatePaymentNotification({
    required PaymentNotification paymentNotification,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final response = await localDataSource.updatePaymentNotification();

        return Right(response);
      } on MockException catch (e) {
        return Left(ApiFailure.other(e.message));
      }
    }
    try {
      final paymentNotificationList = paymentNotification
          .paymentAdviceExpiryNotificationList
          .map((e) => PaymentAdviceExpiryNotificationDto.fromDomain(e).toJson())
          .toList();

      final updatedResponse = await remoteDataSource.updatePaymentNotification(
        disablePaymentNotification:
            paymentNotification.disablePaymentNotification,
        paymentNotification: paymentNotificationList,
      );

      return Right(updatedResponse);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}

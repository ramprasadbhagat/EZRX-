import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:ezrxmobile/domain/account/entities/update_payment_notification_response.dart';

import 'package:ezrxmobile/infrastructure/account/dtos/update_payment_notification_response_dto.dart';

class UpdatePaymentNotificationLocalDataSource {
  UpdatePaymentNotificationLocalDataSource();

  Future<UpdatePaymentNotificationResponse> updatePaymentNotification() async {
    final data = json.decode(
      await rootBundle
          .loadString('assets/json/updatePaymentNotificationResponse.json'),
    );

    return UpdatePaymentNotificationResponseDto.fromJson(
      data['data']['updatePaymentConfig'],
    ).toDomain();
  }
}

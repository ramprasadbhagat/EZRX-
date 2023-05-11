import 'dart:convert';

import 'package:ezrxmobile/domain/account/entities/available_payment_method.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/available_payment_method_dto.dart';
import 'package:flutter/services.dart';

class PaymentConfigurationLocalDataSource {
  PaymentConfigurationLocalDataSource();

  Future<List<AvailablePaymentMethod>> getAvailablePaymentMethods() async {
    final data = json.decode(
      await rootBundle
          .loadString('assets/json/getAvailablePaymentMethods.json'),
    );

    return List.from(data['data']['availablePaymentMethods'])
        .map((e) => AvailablePaymentMethodDto.fromJson(e).toDomain())
        .toList();
  }
}

import 'dart:convert';

import 'package:ezrxmobile/domain/account/entities/available_payment_method.dart';
import 'package:ezrxmobile/domain/account/entities/delete_payment_method.dart';
import 'package:ezrxmobile/domain/account/entities/edit_payment_method.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/available_payment_method_dto.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/delete_payment_method_dto.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/edit_payment_method_dto.dart';
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

  Future<EditPaymentMethod> updatePaymentMethods() async {
    final data = json.decode(
      await rootBundle
          .loadString('assets/json/updatePaymentMethodResponse.json'),
    );

    return EditPaymentMethodDto.fromJson(data['data']['updatePaymentMethods'])
        .toDomain();
  }

  Future<DeletePaymentMethod> deletePaymentMethods() async {
    final data = json.decode(
      await rootBundle
          .loadString('assets/json/deletePaymentMethodResponse.json'),
    );

    return DeletePaymentMethodDto.fromJson(data['data']['deletePaymentMethods'])
        .toDomain();
  }
}

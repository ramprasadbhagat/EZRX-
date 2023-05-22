import 'dart:convert';

import 'package:ezrxmobile/infrastructure/account/dtos/available_payment_method_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;
  group(
    'Test Available Payment Method DTO',
    () {
      setUp(
        () async {
          data = json.decode(await rootBundle.loadString(
              'assets/json/getAvailablePaymentMethodsResponse.json'));
        },
      );
      test(
        '=> data mapping',
        () {
          final paymentMethodList =
              List.from(data['data']['availablePaymentMethods'])
                  .map((e) => AvailablePaymentMethodDto.fromJson(e).toDomain())
                  .toList();
          expect(paymentMethodList.length, 10);
          expect(paymentMethodList.first.salesOrg.getOrCrash(), '2900');

          final paymentMethodDtoList = paymentMethodList
              .map((e) => AvailablePaymentMethodDto.fromDomain(e))
              .toList();
          expect(paymentMethodDtoList.length, 10);
          expect(paymentMethodDtoList.first.salesOrg, '2900');

          final paymentMethodDtoListMap =
              paymentMethodDtoList.map((e) => e.toJson()).toList();
          expect(paymentMethodDtoListMap.length, 10);
          expect(paymentMethodDtoListMap.first['salesOrg'], '2900');
        },
      );
    },
  );
}

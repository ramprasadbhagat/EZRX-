import 'dart:convert';

import 'package:ezrxmobile/infrastructure/account/dtos/delete_payment_method_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;
  group(
    'Test Delete Payment Method DTO',
    () {
      setUp(
        () async {
          data = json.decode(await rootBundle
              .loadString('assets/json/deletePaymentMethodResponse.json'));
        },
      );
      test(
        '=> data mapping',
        () {
          final deletePaymentMethod = DeletePaymentMethodDto.fromJson(
                  data['data']['deletePaymentMethods'])
              .toDomain();
          expect(deletePaymentMethod.success, true);

          final deletePaymentMethodDto =
              DeletePaymentMethodDto.fromDomain(deletePaymentMethod);
          expect(deletePaymentMethodDto.success, true);

          final deletePaymentMethodDtoMap = deletePaymentMethodDto.toJson();
          expect(deletePaymentMethodDtoMap['success'], true);
        },
      );
    },
  );
}

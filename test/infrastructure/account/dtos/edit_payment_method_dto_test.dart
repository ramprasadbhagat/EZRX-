import 'dart:convert';

import 'package:ezrxmobile/infrastructure/account/dtos/edit_payment_method_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;
  group(
    'Test Edit Payment Method DTO',
    () {
      setUp(
        () async {
          data = json.decode(
            await rootBundle
                .loadString('assets/json/updatePaymentMethodResponse.json'),
          );
        },
      );
      test(
        '=> data mapping',
        () {
          final editPaymentMethod = EditPaymentMethodDto.fromJson(
            data['data']['updatePaymentMethods'],
          ).toDomain();
          expect(editPaymentMethod.success, true);
          expect(editPaymentMethod.action, 'Update');

          final editPaymentMethodDto =
              EditPaymentMethodDto.fromDomain(editPaymentMethod);
          expect(editPaymentMethodDto.success, true);
          expect(editPaymentMethodDto.action, 'Update');

          final editPaymentMethodJson = editPaymentMethodDto.toJson();
          expect(editPaymentMethodJson['success'], true);
          expect(editPaymentMethodJson['action'], 'Update');
        },
      );
    },
  );
}

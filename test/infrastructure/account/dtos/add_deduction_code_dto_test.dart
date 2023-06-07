import 'dart:convert';

import 'package:ezrxmobile/infrastructure/account/dtos/add_deduction_code_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;
  group(
    'Test AddDeductionCode DTO',
    () {
      setUp(
        () async {
          data = json.decode(await rootBundle
              .loadString('assets/json/addDeductionCodeResponse.json'));
        },
      );
      test(
        '=> data mapping',
        () {
          final deductionCode =
              AddDeductionCodeDto.fromJson(data['data']['addDeductionCode'])
                  .toDomain();
          expect(deductionCode.success, true);

          final deductionCodeDto =
              AddDeductionCodeDto.fromDomain(deductionCode);
          expect(deductionCodeDto.success, true);

          final deductionCodeDtoMap = deductionCodeDto.toJson();
          expect(deductionCodeDtoMap['success'], true);
        },
      );
    },
  );
}

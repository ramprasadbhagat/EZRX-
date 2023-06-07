import 'dart:convert';

import 'package:ezrxmobile/infrastructure/account/dtos/deduction_code_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;
  group(
    'Test DeductionCode DTO',
    () {
      setUp(
        () async {
          data = json.decode(await rootBundle
              .loadString('assets/json/getDeductionCodesResponse.json'));
        },
      );
      test(
        '=> data mapping',
        () {
          final deductionCodeList = List.from(data['data']['deductionCodes'])
              .map((e) => DeductionCodeDto.fromJson(e).toDomain())
              .toList();
          expect(deductionCodeList.length, 10);
          expect(deductionCodeList.first.salesOrg.getOrCrash(), '2500');

          final deductionCodeDtoList = deductionCodeList
              .map((e) => DeductionCodeDto.fromDomain(e))
              .toList();
          expect(deductionCodeDtoList.length, 10);
          expect(deductionCodeDtoList.first.salesOrg, '2500');

          final deductionCodeDtoListMap =
              deductionCodeDtoList.map((e) => e.toJson()).toList();
          expect(deductionCodeDtoListMap.length, 10);
          expect(deductionCodeDtoListMap.first['salesOrg'], '2500');
        },
      );
    },
  );
}

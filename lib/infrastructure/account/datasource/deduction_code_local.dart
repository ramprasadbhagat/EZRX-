import 'dart:convert';

import 'package:ezrxmobile/domain/account/entities/deduction_code.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/deduction_code_dto.dart';
import 'package:flutter/services.dart';

class DeductionCodeLocalDataSource {
  DeductionCodeLocalDataSource();

  Future<List<DeductionCode>> getDeductionCodes() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/getDeductionCodesResponse.json'),
    );

    return List.from(data['data']['deductionCodes'])
        .map((e) => DeductionCodeDto.fromJson(e).toDomain())
        .toList();
  }
}

import 'dart:convert';
import 'package:ezrxmobile/domain/account/entities/bank_benificiary.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/bank_benificiary_dto.dart';
import 'package:flutter/services.dart';

class BankBeneficiaryLocalDataSource {
  BankBeneficiaryLocalDataSource();

  Future<List<BankBeneficiary>> getBankBeneficiaries() async {
    final data = json.decode(
      await rootBundle
          .loadString('assets/json/getManageBankBenificiary.json'),
    );

    return List.from(data['data']['bankBeneficiary'])
        .map((e) => BankBeneficiaryDto.fromJson(e).toDomain())
        .toList();
  }
}

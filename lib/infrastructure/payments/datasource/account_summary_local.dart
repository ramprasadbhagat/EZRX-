import 'dart:convert';

import 'package:ezrxmobile/domain/payments/entities/credit_limit.dart';
import 'package:ezrxmobile/domain/payments/entities/outstanding_balance.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/credit_limit_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/outstanding_balance_dto.dart';
import 'package:flutter/services.dart';

class AccountSummaryLocalDataSource {
  AccountSummaryLocalDataSource();

  Future<OutstandingBalance> fetchInvoiceSummary() async {
    await Future.delayed(const Duration(seconds: 2));
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/getOutstandingBalanceResponse.json',
      ),
    );
    final details = data['data']['outstandingBalance']['results'];
    final result = <OutstandingBalance>[];
    for (final dynamic detail in details) {
      result.add(OutstandingBalanceDto.fromJson(detail).toDomain());
    }

    return result.first;
  }

  Future<CreditLimit> fetchCreditSummary() async {
    await Future.delayed(const Duration(seconds: 2));
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/getCreditLimitResponse.json',
      ),
    );
    final details = data['data']['creditLimit']['results'];
    final result = <CreditLimit>[];
    for (final dynamic detail in details) {
      result.add(CreditLimitDto.fromJson(detail).toDomain());
    }

    return result.first;
  }
}

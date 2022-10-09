import 'dart:convert';

import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/customer_code_dto.dart';
import 'package:flutter/services.dart';

class CustomerCodeLocalDataSource {
  CustomerCodeLocalDataSource();

  Future<List<CustomerCodeInfo>> getCustomerCodeList() async {
    await Future.delayed(const Duration(seconds: 3));
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/getCustomerInformationResponse.json',
      ),
    );
    final finalData =
        data['data']['customerInformationSearch']['SoldToInformation'];

    return List.from(finalData)
        .map((e) => CustomerCodeDto.fromJson(e).toDomain())
        .toList();
  }

  Future<List<CustomerCodeInfo>> getSalesRepCustomerCodeList() async {
    await Future.delayed(const Duration(seconds: 3));
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/getCustomerInformationResponseForSalesRep.json',
      ),
    );
    final finalData = data['data']['customerListForSalesRep'];

    return List.from(finalData)
        .map((e) => CustomerCodeDto.fromJson(e).toDomain())
        .toList();
  }
}

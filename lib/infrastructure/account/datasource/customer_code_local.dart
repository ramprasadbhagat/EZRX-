import 'dart:convert';

import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/customer_code_dto.dart';
import 'package:flutter/services.dart';

class CustomerCodeLocalDataSource {
  CustomerCodeLocalDataSource();

  Future<List<CustomerCodeInfo>> getCustomerInfo({
    required String loginUserType,
  }) async {
    final data = json.decode(
      await rootBundle.loadString(loginUserType == 'client'
          ? 'assets/json/getCustomerInformationResponse.json'
          : 'assets/json/getCustomerInformationResponseForSalesRep.json'),
    );
    var finalData = loginUserType == 'client'
        ? data['data']['customerInformationSearch']['SoldToInformation']
        : data['data']['customerListForSalesRep'];

    return List.from(finalData)
        .map((e) => CustomerCodeDto.fromJson(e).toDomain())
        .toList();
  }
}

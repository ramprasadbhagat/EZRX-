import 'dart:convert';

import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/customer_open_item_dto.dart';
import 'package:flutter/services.dart';

class NewPaymentLocalDataSource {
  NewPaymentLocalDataSource();

  Future<List<CustomerOpenItem>> getCustomerOpenItems() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/customerOpenItemsResponse.json',
      ),
    );
    final res = data['data']['customerOpenItems']['customerOpenItemsResponse'];

    final result = <CustomerOpenItem>[];
    for (final dynamic item in res) {
      result.add(CustomerOpenItemDto.fromJson(item).toDomain());
    }

    return result;
  }
}

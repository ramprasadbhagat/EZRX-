import 'dart:convert';

import 'package:flutter/services.dart';

class CustomerMaterialPriceDetailsLocalDataSource {
  CustomerMaterialPriceDetailsLocalDataSource();

  Future<List<dynamic>> getCustomerMaterialPriceDetails() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/getCustomerMaterialPriceDetailsResponse.json',
      ),
    );
    final finalData = data['data']['customerMaterialPriceDetails'];

    return List.from(finalData);
  }
}

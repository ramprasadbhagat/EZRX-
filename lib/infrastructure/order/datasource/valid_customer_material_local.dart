import 'dart:convert';

import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter/services.dart';

class ValidCustomerMaterialLocalDataSource {
  Future<List<MaterialNumber>> getValidMaterialList() async {
    final data = json.decode(
      await rootBundle
          .loadString('assets/json/validCustomerMaterialsResponse.json'),
    );
    final finalData = data['data']['validCustomerMaterials']['materials'];
    await Future.delayed(const Duration(milliseconds: 100));

    return List.from(finalData).map((e) => MaterialNumber(e)).toList();
  }
}

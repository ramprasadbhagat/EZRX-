import 'dart:convert';

import 'package:ezrxmobile/domain/order/entities/material_price_detail.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_price_detail_dto.dart';
import 'package:flutter/services.dart';

class MaterialPriceDetailLocalDataSource {
  MaterialPriceDetailLocalDataSource();

  Future<List<MaterialPriceDetail>> getMaterialDetailList() async {
    await Future.delayed(const Duration(seconds: 1));
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/getCustomerMaterialPriceDetailResponse.json',
      ),
    );
    final finalData = data['data']['customerMaterialPriceDetails'];

    return List.from(makeResponseCamelCase(jsonEncode(finalData)))
        .map((e) => MaterialPriceDetailDto.fromJson(e).toDomain())
        .toList();
  }
}

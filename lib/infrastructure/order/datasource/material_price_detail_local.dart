import 'dart:convert';

import 'package:ezrxmobile/domain/order/entities/material_price_detail.dart';
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

    return List.from(finalData)
        .map((e) => MaterialDetailDto.fromJson(e).toDomain())
        .toList();
  }
}

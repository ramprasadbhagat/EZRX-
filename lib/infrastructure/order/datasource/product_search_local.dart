import 'dart:convert';

import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_dto.dart';
import 'package:flutter/services.dart';

class ProductSearchLocalDataSource {
  ProductSearchLocalDataSource();

  Future<MaterialResponse> getSearchedProductList() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/getAllProductsResponse.json'),
    );

    final finalData =
        makeResponseCamelCase(jsonEncode(data['data']['GetAllProducts']));

    return MaterialResponseDto.fromJson(finalData).toDomain();
  }
}

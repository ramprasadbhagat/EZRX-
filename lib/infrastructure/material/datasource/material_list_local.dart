import 'dart:convert';

import 'package:ezrxmobile/domain/material/entities/material_info.dart';
import 'package:ezrxmobile/infrastructure/material/dtos/material_dto.dart';
import 'package:flutter/services.dart';

class MaterialListLocalDataSource {
  MaterialListLocalDataSource();

  Future<List<MaterialInfo>> getMaterialList({
    required String loginUserType,
  }) async {
    final data = json.decode(
      await rootBundle.loadString(loginUserType == 'client'
          ? 'assets/json/getMaterialsWithMetaResponse.json'
          : 'assets/json/getCustomerMaterialsForSalesRepResponse.json'),
    );
    var finalData = loginUserType == 'client'
        ? data['data']['materialsWithMeta']['materials']
        : data['data']['customerMaterialsForSalesRep']['materials'];

    return List.from(finalData)
        .map((e) => MaterialDto.fromJson(e).toDomain())
        .toList();
  }
}

import 'dart:convert';

import 'package:ezrxmobile/domain/material/entities/material_info.dart';
import 'package:ezrxmobile/infrastructure/order/material/dtos/material_dto.dart';
import 'package:flutter/services.dart';

class MaterialListLocalDataSource {
  MaterialListLocalDataSource();

  Future<List<MaterialInfo>> getMaterialList() async {
    final data = json.decode(
      await rootBundle
          .loadString('assets/json/getMaterialsWithMetaResponse.json'),
    );
    final finalData = data['data']['materialsWithMeta']['materials'];

    return List.from(finalData)
        .map((e) => MaterialDto.fromJson(e).toDomain())
        .toList();
  }

  Future<List<MaterialInfo>> getMaterialListSalesRep() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/getCustomerMaterialsForSalesRepResponse.json',
      ),
    );
    final finalData = data['data']['customerMaterialsForSalesRep']['materials'];

    return List.from(finalData)
        .map((e) => MaterialDto.fromJson(e).toDomain())
        .toList();
  }
}

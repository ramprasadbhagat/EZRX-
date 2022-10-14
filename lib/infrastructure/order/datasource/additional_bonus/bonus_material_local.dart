import 'dart:convert';

import 'package:ezrxmobile/domain/material/entities/material_info.dart';
import 'package:ezrxmobile/infrastructure/material/dtos/material_dto.dart';
import 'package:flutter/services.dart';

class BonusMaterialLocalDataSource {
  BonusMaterialLocalDataSource();

  Future<List<MaterialInfo>> getadditionalBonus() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/additionalBonusMaterial.json'),
    );

    return List.from(data['data']['additionalBonusMaterial']['materials'])
        .map((e) => MaterialDto.fromJson(e).toDomain())
        .toList();
  }

  Future<List<MaterialInfo>> customerMaterialsForSalesRep() async {
    final data = json.decode(
      await rootBundle
          .loadString('assets/json/customerMaterialsForSalesRep.json'),
    );

    return List.from(data['data']['customerMaterialsForSalesRep']['materials'])
        .map((e) => MaterialDto.fromJson(e).toDomain())
        .toList();
  }
}

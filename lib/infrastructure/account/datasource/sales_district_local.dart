import 'dart:convert';

import 'package:ezrxmobile/domain/account/entities/sales_district.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/sales_district_dto.dart';
import 'package:flutter/services.dart';

class SalesDistrictLocalDataSource {
  SalesDistrictLocalDataSource();

  Future<List<SalesDistrict>> getSalesDistrictList() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/getSalesDistrictResponse.json'),
    );

    return List.from(data['data']['salesDistrict'])
        .map((e) => SalesDistrictDto.fromJson(e).toDomain())
        .toList();
  }
}

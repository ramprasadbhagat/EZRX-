import 'dart:convert';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_dto.dart';
import 'package:flutter/services.dart';

class MaterialBundleListLocalDatasource {
  MaterialBundleListLocalDatasource();

  Future<List<MaterialInfo>> getMaterialBundleList() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/getMaterialBundleListResponse.json',
      ),
    );

    return List.from(makeResponseCamelCase(
      jsonEncode(data['data']['GetBundles']),
    )).map((e) => MaterialDto.fromJson(e).toDomain()).toList();
  }

  Future<List<MaterialInfo>> getMaterialBundleListForSalesRep() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/getMaterialBundleListForSalesRepResponse.json',
      ),
    );

    return List.from(makeResponseCamelCase(
      jsonEncode(data['data']['GetBundlesForSalesRep']),
    )).map((e) => MaterialDto.fromJson(e).toDomain()).toList();
  }

  dynamic makeResponseCamelCase(String resp) {
    final camelCaseJsonKeys = resp.replaceAllMapped(
      RegExp(
        '(?<key>[\\w\\d]+)(?:\\"|\')(?:\\:\\s*)',
      ),
      (Match m) {
        return m.group(0)![0].toLowerCase() + m.group(0)!.substring(1);
      },
    );

    return jsonDecode(camelCaseJsonKeys);
  }
}

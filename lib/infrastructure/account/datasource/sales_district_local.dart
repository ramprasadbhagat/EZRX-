import 'dart:convert';

import 'package:ezrxmobile/domain/account/entities/manage_sales_district.dart';
import 'package:ezrxmobile/domain/account/entities/sales_district.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/manage_sales_district_dto.dart';
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

  Future<SalesDistrictResponseMessage> addSalesDistrict() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/addSalesDistrictResponse.json'),
    );

    return ManageSalesDistrictDto.fromJson(
      data['data']['addSalesDistrict'],
    ).toDomain();
  }

  Future<SalesDistrictResponseMessage> editSalesDistrict() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/editSalesDistrictResponse.json'),
    );

    return ManageSalesDistrictDto.fromJson(
      data['data']['addSalesDistrict'],
    ).toDomain();
  }

  Future<SalesDistrictResponseMessage> deleteSalesDistrict() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/deleteSalesDistrictResponse.json'),
    );

    return ManageSalesDistrictDto.fromJson(
      data['data']['deleteSalesDistrict'],
    ).toDomain();
  }
}

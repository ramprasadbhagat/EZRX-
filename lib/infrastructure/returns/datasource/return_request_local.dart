import 'dart:convert';

import 'package:ezrxmobile/domain/returns/entities/return_material_list.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_material_list_dto.dart';
import 'package:flutter/services.dart';

class ReturnRequestLocalDataSource {
  ReturnRequestLocalDataSource();

  Future<ReturnMaterialList> searchReturnMaterials() async {
    final data = json.decode(
      await rootBundle
          .loadString('assets/json/searchReturnMaterialsV2Response.json'),
    );

    return ReturnMaterialListDto.fromJson(
      data['data']['searchReturnMaterialsV2'],
    ).toDomain();
  }

  Future<ReturnMaterialList> searchReturnMaterialsForSalesRep() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/searchReturnMaterialSalesRepV2Response.json',
      ),
    );

    return ReturnMaterialListDto.fromJson(
      data['data']['searchReturnMaterialsForSalesRepV2'],
    ).toDomain();
  }

  Future<String> addRequest() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/addRequestV2Response.json'),
    );

    return data['data']['addRequestV2']['requestID'] as String;
  }
}

import 'dart:convert';

import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/stock_info_dto.dart';
import 'package:flutter/services.dart';

class StockInfoLocalDataSource {
  StockInfoLocalDataSource();

  Future<StockInfo> getStockInfo() async {
    await Future.delayed(const Duration(seconds: 1));
    final data = json.decode(
      await rootBundle.loadString('assets/json/stockInformationResponse.json'),
    );

    return StockInfoDto.fromJson(data['data']['stockInformation']).toDomain();
  }

  Future<List<StockInfo>> getStockInfoList() async {
    await Future.delayed(const Duration(seconds: 1));
    final data = json.decode(
      await rootBundle
          .loadString('assets/json/stockInformationListResponse.json'),
    );

    return List.from(data['data']['stockInformationList'])
        .map((e) => StockInfoDto.fromJson(e).toDomain())
        .toList();
  }


  Future<List<MaterialStockInfo>> getMaterialStockInfoList() async {
    await Future.delayed(const Duration(seconds: 1));
    final data = json.decode(
      await rootBundle.loadString('assets/json/getStockInformationList.json'),
    );

    return List.from(data['data']['getStockInformationLists'])
        .map((e) => MaterialStockInfoDto.fromJson(e).toDomain())
        .toList();
  }
}

import 'dart:convert';

import 'package:ezrxmobile/domain/material/entities/stock_info.dart';
import 'package:ezrxmobile/infrastructure/material/dtos/stock_info_dto.dart';
import 'package:flutter/services.dart';

class StockInfoLocalDataSource {
  StockInfoLocalDataSource();

  Future<StockInfo> getStockInfo() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/stockInformationResponse.json'),
    );

    return StockInfoDto.fromJson(data['data']['stockInformation']).toDomain();
  }

  Future<List<StockInfo>> getStockInfoList() async {
    final data = json.decode(
      await rootBundle
          .loadString('assets/json/stockInformationListResponse.json'),
    );

    return List.from(data['data']['stockInformationList'])
        .map((e) => StockInfoDto.fromJson(e).toDomain())
        .toList();
  }
}

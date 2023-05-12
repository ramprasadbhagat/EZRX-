import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:ezrxmobile/domain/returns/entities/return_price.dart';

import 'package:ezrxmobile/infrastructure/returns/dtos/return_price_dto.dart';

class ReturnPriceLocalDataSource {
  ReturnPriceLocalDataSource();

  Future<ReturnPrice> fetchReturnPrice() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/getReturnPrice.json'),
    );

    return ReturnPriceDto.fromJson(data['data']['getReturnPrice'][0])
        .toDomain();
  }
}

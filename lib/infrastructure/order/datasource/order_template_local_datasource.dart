import 'dart:convert';

import 'package:ezrxmobile/domain/order/entities/order_template.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_template_dto.dart';
import 'package:flutter/services.dart';

class OrderTemplateLocalDataSource {
  OrderTemplateLocalDataSource();

  Future<List<OrderTemplate>> getOrderTemplates() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/getOrderTemplatesResponse.json'),
    );
    final finalData = data['data']['orderTemplates'];

    return List.from(finalData)
        .where((e) => json.decode(e['cartList']) != null)
        .map((e) => OrderTemplateDto.fromJson(e).toDomain())
        .toList();
  }

  Future<OrderTemplate> saveOrderTemplate() async {
    final data = json.decode(
      await rootBundle
          .loadString('assets/json/saveOrderTemplatesResponse.json'),
    );

    return OrderTemplateDto.fromJson(
      data['data']['createOrderTemplate']['orderTemplate'],
    ).toDomain();
  }
}

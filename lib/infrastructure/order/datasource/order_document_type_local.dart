import 'dart:convert';

import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_document_type_aggregate_dto.dart';
import 'package:flutter/services.dart';

class OrderDocumentTypeLocalDataSource {
  OrderDocumentTypeLocalDataSource();
  Future<List<OrderDocumentType>> getOrderDocumentTypList() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/orderDocumentTypeResponse.json'),
    );
    
    return List.from(data['data']['orderDocumentType']['documentTypes'])
        .map((e) => OrderDocumentTypeDto.fromJson(e).toDomain())
        .toList();
  }
}

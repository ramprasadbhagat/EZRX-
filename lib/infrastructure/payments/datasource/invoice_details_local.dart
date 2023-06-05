import 'dart:convert';

import 'package:ezrxmobile/domain/payments/entities/customer_document_detail.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/customer_document_detail_dto.dart';
import 'package:flutter/services.dart';

class InvoiceDetailsLocalDataSource {
  InvoiceDetailsLocalDataSource();

  Future<List<CustomerDocumentDetail>> getInvoiceDetails() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/customerDocumentDetailsResponse.json',
      ),
    );
    final res = data['data']['customerDocumentDetails'];

    return res
        .map((data) => CustomerDocumentDetailDto.fromJson(data).toDomain());
  }
}

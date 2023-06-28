import 'dart:convert';

import 'package:ezrxmobile/domain/payments/entities/customer_document_header.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/customer_document_header_dto.dart';
import 'package:flutter/services.dart';

class AllCreditsAndInvoicesLocalDataSource {
  AllCreditsAndInvoicesLocalDataSource();

  Future<CustomerDocumentHeader> getCustomerDocumentHeader() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/customerDocumentHeaderResponse.json',
      ),
    );
    final res = data['data']['customerDocumentHeader'];

    return CustomerDocumentHeaderDto.fromJson(res).toDomain();
  }
}

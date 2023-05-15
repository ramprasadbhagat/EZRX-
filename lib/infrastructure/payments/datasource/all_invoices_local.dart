import 'dart:convert';

import 'package:ezrxmobile/domain/payments/entities/available_statuses.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_header.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/available_statuses_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/customer_document_header_dto.dart';
import 'package:flutter/services.dart';

class AllInvoicesLocalDataSource {
  AllInvoicesLocalDataSource();

  Future<AvailableStatuses> getAvailableStatuses() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/availableStatusesResponse.json',
      ),
    );
    final res = data['data']['availableStatuses'];

    return AvailableStatusesDto.fromJson(res).toDomain();
  }
  
  Future<CustomerDocumentHeader> getAllInvoices() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/customerDocumentHeaderResponse.json',
      ),
    );
    final res = data['data']['customerDocumentHeader'];

    return CustomerDocumentHeaderDto.fromJson(res).toDomain();
  }
}

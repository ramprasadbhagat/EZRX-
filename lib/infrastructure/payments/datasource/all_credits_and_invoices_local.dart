import 'dart:convert';

import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/domain/payments/entities/invoice_order_item.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/credit_and_invoice_item_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/invoice_order_item_dto.dart';
import 'package:flutter/services.dart';

class AllCreditsAndInvoicesLocalDataSource {
  AllCreditsAndInvoicesLocalDataSource();

  Future<List<CreditAndInvoiceItem>> getDocumentHeaderList() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/customerDocumentHeaderV2Response.json',
      ),
    );
    final res = data['data']['customerDocumentHeaderV2']['documentHeaderList'];

    final result = <CreditAndInvoiceItem>[];
    for (final dynamic item in res) {
      result.add(CreditAndInvoiceItemDto.fromJson(item).toDomain());
    }

    return result;
  }

  Future<List<InvoiceOrderItem>> getOrderForInvoice() async {
    final res = json.decode(
      await rootBundle.loadString(
        'assets/json/getOrdersForInvoiceIdResponse.json',
      ),
    );

    return List.from(res['data']['getOrdersForInvoiceId'])
        .map((e) => InvoiceOrderItemDto.fromJson(e).toDomain)
        .toList();
  }
}

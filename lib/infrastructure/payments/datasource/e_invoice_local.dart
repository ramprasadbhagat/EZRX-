import 'dart:convert';

import 'package:ezrxmobile/domain/payments/entities/download_payment_attachments.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/e_invoice_dto.dart';
import 'package:flutter/services.dart';

class EInvoiceLocalDataSource {
  EInvoiceLocalDataSource();

  Future<DownloadPaymentAttachment> getEInvoice() async {
    final res = json.decode(
      await rootBundle.loadString(
        'assets/json/listSoaResponse.json',
      ),
    );
    final data = res['data'].first;

    return EInvoiceDto.fromJson(data).toDomain();
  }
}

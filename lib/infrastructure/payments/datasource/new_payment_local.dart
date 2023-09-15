import 'dart:convert';

import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_info.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_invoice_info_pdf.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/customer_open_item_dto.dart';
import 'package:flutter/services.dart';

class NewPaymentLocalDataSource {
  NewPaymentLocalDataSource();

  Future<List<CustomerOpenItem>> getCustomerOpenItems() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/customerOpenItemsResponse.json',
      ),
    );
    final res = data['data']['customerOpenItems']['customerOpenItemsResponse'];

    final result = <CustomerOpenItem>[];
    for (final dynamic item in res) {
      result.add(CustomerOpenItemDto.fromJson(item).toDomain());
    }

    return result;
  }

  Future<PaymentInfo> pay({required String currentMarket}) async {
    var data = {};
    switch (currentMarket) {
      case 'PH':
        data = json.decode(
          await rootBundle.loadString(
            'assets/json/payResponsePH.json',
          ),
        );
        break;
      case 'MY':
        data = json.decode(
          await rootBundle.loadString(
            'assets/json/payResponseMY.json',
          ),
        );
        break;
      case 'VN':
      default:
        data = json.decode(
          await rootBundle.loadString(
            'assets/json/payResponseVN.json',
          ),
        );
        break;
    }

    return data['data']['addCustomerPayment'];
  }

  Future<void> updatePaymentGateway() async {
    json.decode(
      await rootBundle.loadString(
        'assets/json/updatePaymentGatewayResponse.json',
      ),
    );
  }

  Future<PaymentInvoiceInfoPdf> getPaymentInvoiceInfoPdf() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/paymentInvoiceInfoPdf.json',
      ),
    );

    return data['data']['paymentInvoicePdf'];
  }
}

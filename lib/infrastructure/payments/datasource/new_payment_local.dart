import 'dart:convert';

import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/create_virtual_account.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_payment_info.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_info.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_invoice_info_pdf.dart';
import 'package:ezrxmobile/domain/payments/entities/new_payment_method.dart';
import 'package:ezrxmobile/domain/payments/entities/principal_cutoffs.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/create_virtual_account_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/customer_open_item_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/customer_payment_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/payment_info_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/payment_method_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/payment_invoice_info_pdf_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/principal_cutoffs_dto.dart';
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

  Future<PaymentInfo> pay({required SalesOrg salesOrg}) async {
    final data = json.decode(
      await rootBundle.loadString(
        salesOrg.paymentInfoResponsePath,
      ),
    );

    return PaymentInfoDto.fromJson(data['data']['addCustomerPayment'])
        .toDomain();
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
        'assets/json/paymentInvoiceInfoPdfResponse.json',
      ),
    );

    return PaymentInvoiceInfoPdfDto.fromJson(data['data']['paymentInvoicePdf'])
        .toDomain();
  }

  Future<List<NewPaymentMethod>> fetchPaymentMethods() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/paymentMethodsResponse.json',
      ),
    );

    final finalData = data['data']['availablePaymentMethods'];

    return List.from(finalData)
        .map((e) => PaymentMethodDto.fromJson(e).toDomain())
        .toList();
  }

  Future<CustomerPaymentInfo> getCustomerPayment({
    required SalesOrg salesOrg,
    required String baseUrl,
  }) async {
    final data = json.decode(
      await rootBundle.loadString(
        salesOrg.customerPaymentResponsePath,
      ),
    );

    return CustomerPaymentDto.fromJson(data['data']['customerPayment'])
        .customerPaymentResponse
        .first
        .toDomain(baseUrl: baseUrl);
  }

  Future<CreateVirtualAccount> createVirtualAccount() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/createVirtualAccountResponse.json',
      ),
    );

    return CreateVirtualAccountDto.fromJson(
      data['data']['createVirtualAccount'],
    ).toDomain();
  }

  Future<PrincipalCutoffs> getPrincipalCutoffs() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/getPrincipalCutoffsResponse.json',
      ),
    );

    return PrincipalCutoffsDto.fromJson(
      data['data']['getPrincipalCutoffs'],
    ).toDomain();
  }
}

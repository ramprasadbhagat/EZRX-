import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/available_credit_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/domain/payments/entities/outstanding_invoice_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_info.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_invoice_info_pdf.dart';

abstract class INewPaymentRepository {
  Future<Either<ApiFailure, List<CustomerOpenItem>>> getOutstandingInvoices({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required int pageSize,
    required int offset,
    required OutstandingInvoiceFilter appliedFilter,
    required SearchKey searchKey,
  });

  Future<Either<ApiFailure, List<CustomerOpenItem>>> getAvailableCreditNotes({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required int pageSize,
    required int offset,
    required AvailableCreditFilter appliedFilter,
    required SearchKey searchKey,
  });

  Future<Either<ApiFailure, PaymentInfo>> pay({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required List<CustomerOpenItem> customerOpenItems,
    required String paymentMethod,
    required User user,
  });

  Future<Either<ApiFailure, Unit>> updatePaymentGateway({
    required SalesOrganisation salesOrganisation,
    required Uri uri,
  });

  Future<Either<ApiFailure, PaymentInvoiceInfoPdf>> getPaymentInvoiceInfoPdf({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required User user,
    required PaymentInfo paymentInfo,
  });

  Future<Either<ApiFailure, Unit>> saveFile({required Uint8List pdfData});
}

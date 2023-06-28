import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/all_credits_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_header.dart';

abstract class IAllCreditsAndInvoicesRepository {
  Future<Either<ApiFailure, CustomerDocumentHeader>> filterInvoices({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required AllInvoicesFilter filter,
    required int pageSize,
    required int offset,
  });
  Future<Either<ApiFailure, CustomerDocumentHeader>> filterCredits({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required int pageSize,
    required int offset,
    required AllCreditsFilter filter,
  });
}

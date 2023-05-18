import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/available_statuses.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_header.dart';

abstract class IAllCreditsAndInvoicesRepository {
  Future<Either<ApiFailure, CustomerDocumentHeader>> getAllInvoices({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required String sortDirection,
    required int pageSize,
    required int offSet,
  });
  Future<Either<ApiFailure, AvailableStatuses>> getAvailableStatuses({
    required SalesOrganisation salesOrganisation,
    required int pageSize,
    required int offSet,
  });
  Future<Either<ApiFailure, CustomerDocumentHeader>> getAllCredits({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required String sortDirection,
    required int pageSize,
    required int offSet,
  });
}

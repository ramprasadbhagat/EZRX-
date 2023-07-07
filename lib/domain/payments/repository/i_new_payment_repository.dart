import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';

abstract class INewPaymentRepository {
  Future<Either<ApiFailure, List<CustomerOpenItem>>> getOutstandingInvoices({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required int pageSize,
    required int offset,
  });
  Future<Either<ApiFailure, List<CustomerOpenItem>>> getAvailableCreditNotes({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required int pageSize,
    required int offset,
  });
  
}

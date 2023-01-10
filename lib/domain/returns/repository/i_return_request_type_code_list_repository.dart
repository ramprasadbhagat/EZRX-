import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_type_code_details.dart';

abstract class IReturnRequestTypeCodeRepository {
  Future<Either<ApiFailure, List<ReturnRequestTypeCodeDetails>>>
      getReturnRequestTypeCodeList({
    required SalesOrganisation salesOrganisation,
  });
}

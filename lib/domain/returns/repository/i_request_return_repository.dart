import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/request_return_filter.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request.dart';

abstract class IReturnRequestRepository {
  Future<Either<ApiFailure, ReturnRequest>> searchReturnRequestList({
    required RequestReturnFilter requestReturnFilter,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
    required CustomerCodeInfo customerCodeInfo,
    required int pageSize,
    required int offset,
  });
}

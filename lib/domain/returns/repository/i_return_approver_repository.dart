import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/request_information.dart';
import 'package:ezrxmobile/domain/returns/entities/return_approver_filter.dart';
import 'package:ezrxmobile/domain/returns/entities/return_requests_id.dart';

abstract class IReturnApproverRepository {
  Future<Either<ApiFailure, List<ReturnRequestsId>>> getReturnRequests({
    required User user,
    required int offset,
    required int pageSize,
    required ReturnApproverFilter approverReturnFilter,
  });
  Future<Either<ApiFailure, List<RequestInformation>>> getReturnInformation({
    required List<ReturnRequestsId> returnRequestIds,
  });
}

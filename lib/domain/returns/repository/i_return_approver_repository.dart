import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/return_approver_filter.dart';
import 'package:ezrxmobile/domain/returns/entities/approver_return_request.dart';
import 'package:ezrxmobile/domain/returns/entities/approver_return_requests_id.dart';

abstract class IReturnApproverRepository {
  Future<Either<ApiFailure, List<ApproverReturnRequestsId>>> getReturnRequests({
    required User user,
    required int offset,
    required int pageSize,
    required ReturnApproverFilter approverReturnFilter,
  });
  Future<Either<ApiFailure, List<ApproverReturnRequest>>> getReturnInformation({
    required List<ApproverReturnRequestsId> returnRequestIds,
  });
}

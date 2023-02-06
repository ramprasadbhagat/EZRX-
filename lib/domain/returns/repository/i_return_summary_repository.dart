import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/return_summary_request_information.dart';

abstract class IReturnSummaryRepository {
  Future<Either<ApiFailure, List<ReturnSummaryRequestInformation>>>
      getReturnSummaryRequestByUser({
    required CustomerCodeInfo soldTo,
    required ShipToInfo shipTo,
    required User user,
    required int pageSize,
    required int offSet,
  });
  Future<Either<ApiFailure, ReturnSummaryRequestInformation>>
      getReturnSummaryInformation({
    required String requestID,
  });
}

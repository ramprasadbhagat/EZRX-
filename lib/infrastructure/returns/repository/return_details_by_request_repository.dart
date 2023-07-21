import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/request_information.dart';
import 'package:ezrxmobile/domain/returns/entities/return_requests_id.dart';
import 'package:ezrxmobile/domain/returns/repository/i_return_details_by_request_repository.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_details_by_request_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_details_by_request_remote.dart';

class ReturnDetailsByRequestRepository
    implements IReturnDetailsByRequestRepository {
  final Config config;
  final ReturnSummaryDetailsByRequestLocal returnSummaryDetailsByRequestLocal;
  final ReturnSummaryDetailsByRequestRemote returnSummaryDetailsByRequestRemote;

  ReturnDetailsByRequestRepository({
    required this.config,
    required this.returnSummaryDetailsByRequestLocal,
    required this.returnSummaryDetailsByRequestRemote,
  });

  @override
  Future<Either<ApiFailure, RequestInformation>>
      getReturnSummaryDetailsByRequest({
    required ReturnRequestsId returnRequestId,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final returnRequestInformation =
            await returnSummaryDetailsByRequestLocal
                .getReturnSummaryDetailsByRequest();

        return Right(returnRequestInformation);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final returnRequestInformation = await returnSummaryDetailsByRequestRemote
          .getReturnSummaryDetailsByRequest(
        returnRequestId: returnRequestId.requestId,
      );

      return Right(returnRequestInformation);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/request_information.dart';
import 'package:ezrxmobile/domain/returns/entities/return_requests_id.dart';
import 'package:ezrxmobile/domain/returns/repository/i_return_summary_details_repository.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_summary_details_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_summary_details_remote.dart';

class ReturnSummaryDetailsRepository
    implements IReturnSummaryDetailsRepository {
  final Config config;
  final ReturnSummaryDetailsRequestInformationLocal
      returnSummaryDetailsRequestInformationLocal;
  final ReturnSummaryDetailsRequestInformationRemote
      returnSummaryDetailsRequestInformationRemote;

  ReturnSummaryDetailsRepository({
    required this.config,
    required this.returnSummaryDetailsRequestInformationLocal,
    required this.returnSummaryDetailsRequestInformationRemote,
  });

  @override
  Future<Either<ApiFailure, RequestInformation>> getReturnInformation({
    required ReturnRequestsId returnRequestId,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final returnRequestInformation =
            await returnSummaryDetailsRequestInformationLocal
                .getRequestInformation();

        return Right(returnRequestInformation);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final returnRequestInformation =
          await returnSummaryDetailsRequestInformationRemote
              .getRequestInformation(
        returnRequestId: returnRequestId.requestId,
      );

      return Right(returnRequestInformation);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}

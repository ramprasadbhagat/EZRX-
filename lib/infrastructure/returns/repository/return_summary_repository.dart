import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/requests_by_user_return_summary.dart';
import 'package:ezrxmobile/domain/returns/entities/return_summary_filter.dart';
import 'package:ezrxmobile/domain/returns/repository/i_return_summary_repository.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_summary_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_summary_remote.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_summary_filter_dto.dart';

class ReturnSummaryRepository implements IReturnSummaryRepository {
  final Config config;
  final ReturnSummaryLocalDataSource returnSummaryLocalDataSource;
  final ReturnSummaryRemoteDataSource returnSummaryRemoteDataSource;

  ReturnSummaryRepository({
    required this.config,
    required this.returnSummaryLocalDataSource,
    required this.returnSummaryRemoteDataSource,
  });
  @override
  Future<Either<ApiFailure, ReturnSummaryRequestByUser>>
      getReturnSummaryRequestByUser({
    required CustomerCodeInfo soldTo,
    required ShipToInfo shipTo,
    required User user,
    required int pageSize,
    required int offSet,
    required ReturnSummaryFilter returnSummaryFilter,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final returnSummaryList =
            await returnSummaryLocalDataSource.getReturnSummaryRequestByUser();

        return Right(returnSummaryList);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final returnSummaryList =
          await returnSummaryRemoteDataSource.getReturnSummaryRequestByUser(
        shipTo: shipTo.shipToCustomerCode,
        soldTo: soldTo.customerCodeSoldTo,
        username: user.username.getOrCrash(),
        pageSize: pageSize,
        offSet: offSet,
        filterQuery:
            ReturnSummaryFilterDto.fromDomain(returnSummaryFilter).toJson(),

      );

      return Right(returnSummaryList);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}

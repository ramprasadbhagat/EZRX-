import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/return_summary_request_information.dart';
import 'package:ezrxmobile/domain/returns/repository/i_return_summary_repository.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_summary_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_summary_remote.dart';
import 'package:ezrxmobile/config.dart';

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
  Future<Either<ApiFailure, List<ReturnSummaryRequestInformation>>>
      getReturnSummaryRequestByUser({
    required CustomerCodeInfo soldTo,
    required ShipToInfo shipTo,
    required User user,
    required int pageSize,
    required int offSet,
  }) async {
    final returnSummaryInformationItems = <ReturnSummaryRequestInformation>[];
    if (config.appFlavor == Flavor.mock) {
      try {
        final returnSummaryList =
            await returnSummaryLocalDataSource.getReturnSummaryRequestByUser();
        await Future.wait(returnSummaryList.map((returnSummaryItem) async {
          final returnSummaryInformatinListItem =
              await getReturnSummaryInformation(
            requestID: returnSummaryItem.requestID,
          );
          returnSummaryInformatinListItem.fold(
            (failure) {
              return Left(FailureHandler.handleFailure(failure));
            },
            (returnSummaryList) {
              returnSummaryInformationItems.add(returnSummaryList);
            },
          );
        }).toList());

        return Right(returnSummaryInformationItems);
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
      );

      await Future.wait(returnSummaryList.map((returnSummaryItem) async {
        final returnSummaryInformatinListItem =
            await getReturnSummaryInformation(
          requestID: returnSummaryItem.requestID,
        );
        returnSummaryInformatinListItem.fold(
          (failure) {
            return Left(FailureHandler.handleFailure(failure));
          },
          (returnSummaryList) {
            returnSummaryInformationItems.add(returnSummaryList);
          },
        );
      }).toList());

      return Right(returnSummaryInformationItems);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, ReturnSummaryRequestInformation>>
      getReturnSummaryInformation({
    required String requestID,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final returnSummaryInformationList =
            await returnSummaryLocalDataSource.getReturnSummaryInformation();

        return Right(returnSummaryInformationList);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final returnSummaryList =
          await returnSummaryRemoteDataSource.getReturnSummaryInformation(
        requestID: requestID,
      );

      return Right(returnSummaryList);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/approver_return_request.dart';
import 'package:ezrxmobile/domain/returns/entities/approver_return_requests_id.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/repository/i_return_approver_repository.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/approver_return_request_information_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/approver_return_request_information_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/approver_return_requests_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/approver_return_requests_remote.dart';

class ReturnApproverRepository implements IReturnApproverRepository {
  final Config config;
  final ApproverReturnRequestsLocal returnRequestLocalDataSource;
  final ApproverReturnRequestsRemote returnRequestRemoteDataSource;
  final ApproverReturnRequestInformationLocal
      returnRequestInformationLocalDataSource;
  final ApproverReturnRequestInformationRemote
      returnRequestInformationRemoteDataSource;

  ReturnApproverRepository({
    required this.config,
    required this.returnRequestLocalDataSource,
    required this.returnRequestRemoteDataSource,
    required this.returnRequestInformationLocalDataSource,
    required this.returnRequestInformationRemoteDataSource,
  });

  @override
  Future<Either<ApiFailure, List<ApproverReturnRequest>>> getReturnInformation({
    required List<ApproverReturnRequestsId> returnRequestIds,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final returnRequestInformations = await Future.wait(returnRequestIds
            .map(
              (e) async => await returnRequestInformationLocalDataSource
                  .getApproverReturnRequestInfomration(
                returnRequestId: e.requestId,
              ),
            )
            .toList());
            
        return Right(returnRequestInformations);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final returnRequestInformations = await Future.wait(returnRequestIds
          .map(
            (e) async => await returnRequestInformationRemoteDataSource
                .getApproverReturnRequestInfomration(
              returnRequestId: e.requestId,
            ),
          )
          .toList());
      if (returnRequestInformations.isEmpty) {
        return const Left(ApiFailure.other('No more data to fetch'));
      }

      return Right(returnRequestInformations);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, List<ApproverReturnRequestsId>>> getReturnRequests({
    required User user,
    required int page,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final approverReturnRequestsIds =
            await returnRequestLocalDataSource.getReturns();

        return Right(approverReturnRequestsIds);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final approverReturnRequestsIds =
          await returnRequestRemoteDataSource.getReturns(
        username: user.username.getOrCrash(),
        page: page,
      );
      if (approverReturnRequestsIds.isEmpty) {
        return const Left(ApiFailure.other('No more data to fetch'));
      }

      return Right(approverReturnRequestsIds);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}

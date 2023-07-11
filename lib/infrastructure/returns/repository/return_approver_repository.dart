
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/request_information.dart';
import 'package:ezrxmobile/domain/returns/entities/return_requests_id.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/return_approver_filter.dart';
import 'package:ezrxmobile/domain/returns/repository/i_return_approver_repository.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/approver_return_request_information_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/approver_return_request_information_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/approver_return_requests_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/approver_return_requests_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_approver_filter_dto.dart';

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
  Future<Either<ApiFailure, List<RequestInformation>>> getReturnInformation({
    required List<ReturnRequestsId> returnRequestIds,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final returnRequestInformation = await Future.wait(returnRequestIds
            .map(
              (e) async => await returnRequestInformationLocalDataSource
                  .getApproverReturnRequestInformation(),
            )
            .toList());

        return Right(returnRequestInformation);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final returnRequestInformation = await Future.wait(returnRequestIds
          .map(
            (e) async => await returnRequestInformationRemoteDataSource
                .getApproverReturnRequestInformation(
              returnRequestId: e.requestId,
            ),
          )
          .toList());

      return Right(returnRequestInformation);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, List<ReturnRequestsId>>> getReturnRequests({
    required User user,
    required int offset,
    required int pageSize,
    required ReturnApproverFilter approverReturnFilter,
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
        offset: offset,
        pageSize: pageSize,
        filterQuery:
            ReturnApproverFilterDto.fromDomain(approverReturnFilter).toJson(),
      );
      
      return Right(approverReturnRequestsIds);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}

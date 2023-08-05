import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_type_code_details.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_request_type_code_local.dart';

import 'package:ezrxmobile/domain/returns/repository/i_return_request_type_code_list_repository.dart';

import 'package:ezrxmobile/infrastructure/returns/datasource/return_request_type_code_remote.dart';

import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';

class ReturnRequestTypeCodeRepository extends IReturnRequestTypeCodeRepository {
  final Config config;
  final ReturnRequestTypeCodeLocalDataSource localDataSource;
  final ReturnRequestTypeCodeRemoteDataSource remoteDataSource;

  ReturnRequestTypeCodeRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<ApiFailure, List<ReturnRequestTypeCodeDetails>>>
      getReturnRequestTypeCodeList({
    required SalesOrganisation salesOrganisation,
  }) async {
    final salesOrgCode = salesOrganisation.salesOrg.getOrCrash();

    if (config.appFlavor == Flavor.mock) {
      try {
        final returnRequestTypeCodeList =
            await localDataSource.getReturnRequestTypeCodeList();

        return Right(returnRequestTypeCodeList);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final returnRequestTypeCodeList = await remoteDataSource
          .getReturnRequestTypeCodeList(salesOrg: salesOrgCode);

      return Right(returnRequestTypeCodeList);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}

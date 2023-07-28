import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material_list.dart';
import 'package:ezrxmobile/domain/returns/repository/i_return_request_repository.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_request_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_request_remote.dart';

class ReturnRequestRepository extends IReturnRequestRepository {
  final Config config;
  final ReturnRequestLocalDataSource localDataSource;
  final ReturnRequestRemoteDataSource remoteDataSource;

  ReturnRequestRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<ApiFailure, ReturnMaterialList>> searchReturnMaterials({
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
    required CustomerCodeInfo customerCodeInfo,
    required int pageSize,
    required int offset,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final returnRequest = await localDataSource.searchReturnMaterials();

        return Right(returnRequest);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final returnRequest = await remoteDataSource.searchReturnMaterials(
        salesOrg: salesOrganisation.salesOrg.getOrCrash(),
        shipTo: shipToInfo.shipToCustomerCode,
        soldTo: customerCodeInfo.customerCodeSoldTo,
        pageSize: pageSize,
        offset: offset,
      );

      return Right(returnRequest);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }
}

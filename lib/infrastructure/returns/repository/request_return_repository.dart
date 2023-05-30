import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/request_return_filter.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/returns/repository/i_request_return_repository.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/request_return_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/request_return_remote.dart';

class RequestReturnRepository extends IReturnRequestRepository {
  final Config config;
  final RequestReturnLocalDatasource localDataSource;
  final RequestReturnRemoteDatasource remoteDataSource;

  RequestReturnRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<ApiFailure, ReturnRequest>> searchReturnRequestList({
    required RequestReturnFilter requestReturnFilter,
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
        batch: requestReturnFilter.batch.getOrDefaultValue(''),
        dateFrom: requestReturnFilter.fromInvoiceDate.apiDateTimeFormat,
        dateTo: requestReturnFilter.toInvoiceDate.apiDateTimeFormat,
        invoiceNo: requestReturnFilter.assignmentNumber.getOrDefaultValue(''),
        materialDescription:
            requestReturnFilter.materialDescription.getOrDefaultValue(''),
        materialNumber:
            requestReturnFilter.materialNumber.getOrDefaultValue(''),
        principalSearch:
            requestReturnFilter.principalSearch.getOrDefaultValue(''),
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

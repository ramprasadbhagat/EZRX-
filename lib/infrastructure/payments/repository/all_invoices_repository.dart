import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/payments/entities/available_statuses.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_header.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/payments/repository/i_all_invoices_repository.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/all_invoices_local.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/all_invoices_remote.dart';

class AllInvoicesRepository extends IAllInvoicesRepository {
  final Config config;
  final AllInvoicesLocalDataSource localDataSource;
  final AllInvoicesRemoteDataSource remoteDataSource;
  AllInvoicesRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<ApiFailure, AvailableStatuses>> getAvailableStatuses({
    required SalesOrganisation salesOrganisation,
    required int pageSize,
    required int offSet,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final response = await localDataSource.getAvailableStatuses();

        return Right(response);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final response = await remoteDataSource.getAvailableStatuses(
        salesOrg: salesOrganisation.salesOrg.getOrCrash(),
        pageSize: pageSize,
        offSet: offSet,
      );

      return Right(response);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }

  @override
  Future<Either<ApiFailure, CustomerDocumentHeader>> getAllInvoices({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required String sortDirection,
    required int pageSize,
    required int offSet,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final response = await localDataSource.getAllInvoices();

        return Right(response);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final response = await remoteDataSource.getAllInvoices(
        salesOrg: salesOrganisation.salesOrg.getOrCrash(),
        customerCode: customerCodeInfo.customerCodeSoldTo,
        sortDirection: sortDirection,
        pageSize: pageSize,
        offSet: offSet,
      );

      return Right(response);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }
}

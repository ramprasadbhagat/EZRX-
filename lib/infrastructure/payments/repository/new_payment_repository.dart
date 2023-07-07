import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/domain/payments/repository/i_new_payment_repository.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/new_payment_remote.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/new_payment_local.dart';

class NewPaymentRepository extends INewPaymentRepository {
  final Config config;
  final NewPaymentLocalDataSource localDataSource;
  final NewPaymentRemoteDataSource remoteDataSource;
  NewPaymentRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<ApiFailure, List<CustomerOpenItem>>> getOutstandingInvoices({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required int pageSize,
    required int offset,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final response = await localDataSource.getCustomerOpenItems();

        return Right(response);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final response = await remoteDataSource.getOutstandingInvoices(
        salesOrg: salesOrganisation.salesOrg.getOrCrash(),
        customerCode: customerCodeInfo.customerCodeSoldTo,
        pageSize: pageSize,
        offset: offset,
      );
      
      return Right(response);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }

  @override
  Future<Either<ApiFailure, List<CustomerOpenItem>>> getAvailableCreditNotes({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required int pageSize,
    required int offset,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final response = await localDataSource.getCustomerOpenItems();

        return Right(response);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final response = await remoteDataSource.getAvailableCreditNotes(
        salesOrg: salesOrganisation.salesOrg.getOrCrash(),
        customerCode: customerCodeInfo.customerCodeSoldTo,
        pageSize: pageSize,
        offset: offset,
      );

      return Right(response);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }
}

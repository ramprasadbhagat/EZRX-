import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';

import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';

import 'package:ezrxmobile/domain/payments/repository/i_payment_summary_repository.dart';

import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';

import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';

import 'package:ezrxmobile/infrastructure/payments/datasource/payment_summary_local_datasource.dart';

import 'package:ezrxmobile/infrastructure/payments/datasource/payment_summary_remote_datasource.dart';

class PaymentSummaryRepository extends IPaymentSummaryRepository {
  final Config config;
  final PaymentSummaryLocalDataSource localDataSource;
  final PaymentSummaryRemoteDataSource remoteDataSource;

  PaymentSummaryRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<ApiFailure, List<PaymentSummaryDetails>>>
      fetchPaymentSummaryList({
    required SalesOrganisation salesOrganization,
    required CustomerCodeInfo customerCodeInfo,
    required int offset,
    required int pageSize,
  }) async {
    final salesOrgCode = salesOrganization.salesOrg.getOrCrash();
    final customerCode = customerCodeInfo.customerCodeSoldTo;
    if (config.appFlavor == Flavor.mock) {
      try {
        final paymentSummaryDetails = await localDataSource.getPaymentSummary();

        return Right(paymentSummaryDetails);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final paymentSummaryList = await remoteDataSource.getPaymentSummary(
        customerCode: customerCode,
        salesOrg: salesOrgCode,
        offset: offset,
        pageSize: pageSize,
      );

      return Right(paymentSummaryList);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}

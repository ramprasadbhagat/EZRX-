import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';

import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details_response.dart';

import 'package:ezrxmobile/domain/payments/repository/i_payment_summary_repository.dart';

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
  Future<Either<ApiFailure, PaymentSummaryDetailsResponse>>
      fetchPaymentSummaryList({
    required PaymentSummaryDetailsResponse paymentSummaryDetails,
    required SalesOrganisation salesOrganization,
    required CustomerCodeInfo customerCodeInfo,
    required int offset,
    required int pageSize,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final paymentSummaryDetailsResponse =
            await localDataSource.getPaymentSummary();

        return Right(paymentSummaryDetailsResponse);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final paymentSummaryDetailsResponse =
          await remoteDataSource.getPaymentSummary(
        customerCode: customerCodeInfo.customerCodeSoldTo,
        salesOrg: salesOrganization.salesOrg.getOrCrash(),
        offset: offset,
        pageSize: pageSize,
      );
      final paymentSummaryList = List<PaymentSummaryDetails>.from(
        paymentSummaryDetailsResponse.paymentSummaryList,
      );

      return Right(
        paymentSummaryDetailsResponse.copyWith(
          paymentSummaryList: paymentSummaryList
            ..addAll(paymentSummaryDetails.paymentSummaryList),
        ),
      );
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}

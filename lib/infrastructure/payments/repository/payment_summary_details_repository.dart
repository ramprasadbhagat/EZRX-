import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_item.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/domain/payments/repository/i_payment_summary_details_repository.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_item_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_item_remote_datasource.dart';

class PaymentSummaryDetailsRepository extends IPaymentSummaryDetailsRepository {
  final Config config;
  final PaymentItemLocalDataSource localDataSource;
  final PaymentItemRemoteDataSource remoteDataSource;

  PaymentSummaryDetailsRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<ApiFailure, PaymentSummaryDetails>>
      fetchPaymentSummaryDetailsInfo({
    required SalesOrganisation salesOrganization,
    required CustomerCodeInfo customerCodeInfo,
    required StringValue paymentId,
  }) async {
    final salesOrgCode = salesOrganization.salesOrg.getOrCrash();
    final customerCode = customerCodeInfo.customerCodeSoldTo;
    if (config.appFlavor == Flavor.mock) {
      try {
        final paymentSummaryDetails =
            await localDataSource.getPaymentSummaryDetails();

        return Right(paymentSummaryDetails);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final paymentSummaryDetails =
          await remoteDataSource.getPaymentSummaryDetails(
        customerCode: customerCode,
        salesOrg: salesOrgCode,
        paymentId: paymentId.getOrCrash(),
      );

      return Right(paymentSummaryDetails);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, List<PaymentItem>>> fetchPaymentList({
    required SalesOrganisation salesOrganization,
    required CustomerCodeInfo customerCodeInfo,
    required PaymentSummaryDetails paymentSummaryDetails,
  }) async {
    final salesOrgCode = salesOrganization.salesOrg.getOrCrash();
    final customerCode = customerCodeInfo.customerCodeSoldTo;
    if (config.appFlavor == Flavor.mock) {
      try {
        final paymentItemList = await localDataSource.getPaymentItems();

        return Right(paymentItemList);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final paymentItemList = await remoteDataSource.getPaymentItemList(
        customerCode: customerCode,
        salesOrg: salesOrgCode,
        paymentID: paymentSummaryDetails.paymentID.getOrCrash(),
        paymentBatchAdditionalInfo:
            paymentSummaryDetails.paymentBatchAdditionalInfo.getOrCrash(),
        accountingDocExternalReference:
            paymentSummaryDetails.accountingDocExternalReference,
      );

      return Right(paymentItemList);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_item.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/domain/payments/repository/i_payment_summary_details_repository.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_item_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_item_remote_datasource.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/payment_summary_details_dto.dart';

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
    required PaymentSummaryDetails details,
  }) async {
    final salesOrg = salesOrganization.salesOrg;
    final customerCode = customerCodeInfo.customerCodeSoldTo;

    return salesOrg.isID
        ? _getTransaction(
            salesOrg: salesOrg,
            customerCode: customerCode,
            paymentId: details.paymentID,
          )
        : _getPaymentSummaryDetails(
            salesOrg: salesOrg,
            customerCode: customerCode,
            filterBy: PaymentSummaryDetailsDto.fromDomain(details).filterBy,
          );
  }

  Future<Either<ApiFailure, PaymentSummaryDetails>> _getTransaction({
    required SalesOrg salesOrg,
    required String customerCode,
    required StringValue paymentId,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final details = await localDataSource.getTransaction();

        return Right(details);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final details = await remoteDataSource.getTransaction(
        customerCode: customerCode,
        salesOrg: salesOrg.getOrCrash(),
        paymentId: paymentId.getOrCrash(),
      );

      return Right(details);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  Future<Either<ApiFailure, PaymentSummaryDetails>> _getPaymentSummaryDetails({
    required SalesOrg salesOrg,
    required String customerCode,
    required Map<String, dynamic> filterBy,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final details = await localDataSource.getPaymentSummaryDetails();

        return Right(details);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final details = await remoteDataSource.getPaymentSummaryDetails(
        customerCode: customerCode,
        salesOrg: salesOrg.getOrCrash(),
        filterBy: filterBy,
      );

      return Right(details);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, List<PaymentItem>>> fetchPaymentList({
    required SalesOrganisation salesOrganization,
    required CustomerCodeInfo customerCodeInfo,
    required PaymentSummaryDetails details,
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
        paymentID: details.paymentID.getOrCrash(),
        paymentBatchAdditionalInfo:
            details.paymentBatchAdditionalInfo.getOrCrash(),
        accountingDocExternalReference: details.accountingDocExternalReference,
      );

      return Right(paymentItemList);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, bool>> deletePaymentAdvice({
    required SalesOrganisation salesOrganization,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required PaymentSummaryDetails paymentSummaryDetails,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final isDeleted = await localDataSource.deleteCustomerPayment();

        return Right(isDeleted);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final isDeleted = await remoteDataSource.deleteCustomerPayment(
        salesOrg: salesOrganization.salesOrg.getOrCrash(),
        customerCode: customerCodeInfo.customerCodeSoldTo,
        shipToCode: shipToInfo.shipToCustomerCode,
        paymentAmount: paymentSummaryDetails.paymentAmount.toString(),
        paymentBatchAdditionalInfo:
            paymentSummaryDetails.paymentBatchAdditionalInfo.getOrCrash(),
        paymentId: paymentSummaryDetails.paymentID.getOrCrash(),
        transactionCurrency: paymentSummaryDetails.transactionCurrency.getOrDefaultValue(''),
        valueDate: paymentSummaryDetails.valueDate.apiDateWithDashString,
        zzAdvice: paymentSummaryDetails.zzAdvice.getOrCrash(),
      );

      return isDeleted
          ? Right(isDeleted)
          : Left(
              ApiFailure.paymentAdviceDeleteFailed(
                paymentSummaryDetails.zzAdvice.displayDashIfEmpty,
              ),
            );
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, String>> cancelPaymentAdvice({
    required SalesOrganisation salesOrganization,
    required CustomerCodeInfo customerCodeInfo,
    required String referenceId,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final response = await localDataSource.cancelPaymentAdvice();

        return Right(response);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final salesOrgCode = salesOrganization.salesOrg.getOrCrash();
      final customerCode = customerCodeInfo.customerCodeSoldTo;
      final response = await remoteDataSource.cancelPaymentAdvice(
        customerCode: customerCode,
        salesOrg: salesOrgCode,
        referenceId: referenceId,
      );

      return Right(response);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}

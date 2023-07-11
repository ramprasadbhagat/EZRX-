import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_item.dart';
import 'package:ezrxmobile/domain/payments/repository/i_payment_item_repository.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_item_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_item_remote_datasource.dart';

class PaymentItedmRepository extends IPaymentItemRepository {
  final Config config;
  final PaymentItemLocalDataSource localDataSource;
  final PaymentItemRemoteDataSource remoteDataSource;

  PaymentItedmRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<ApiFailure, List<PaymentItem>>> fetchPaymentItemList({
    required SalesOrganisation salesOrganization,
    required CustomerCodeInfo customerCodeInfo,
    required String paymentID,
    required String paymentBatchAdditionalInfo,
    required String accountingDocExternalReference,
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
      final paymentItemList = await remoteDataSource.getPaymentItem(
        customerCode: customerCode,
        salesOrg: salesOrgCode,
        paymentID: paymentID,
        paymentBatchAdditionalInfo: paymentBatchAdditionalInfo,
        accountingDocExternalReference: accountingDocExternalReference,
      );

      return Right(paymentItemList);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}

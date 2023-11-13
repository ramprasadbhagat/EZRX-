import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';

import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/transaction_params.dart';

import 'package:ezrxmobile/domain/payments/repository/i_payment_summary_repository.dart';

import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';

import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';

import 'package:ezrxmobile/infrastructure/payments/datasource/payment_summary_local_datasource.dart';

import 'package:ezrxmobile/infrastructure/payments/datasource/payment_summary_remote_datasource.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/payment_summary_filter_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/transaction_params_dto.dart';

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
    required PaymentSummaryFilter filter,
    required SearchKey searchKey,
    required int offset,
    required int pageSize,
  }) async {
    final salesOrgCode = salesOrganization.salesOrg.getOrCrash();
    final customerCode = customerCodeInfo.customerCodeSoldTo;

    return salesOrganization.salesOrg.isID
        ? _getTransactionList(
            customerCode: customerCode,
            filter: filter,
            searchKey: searchKey,
            offset: offset,
            pageSize: pageSize,
          )
        : _getPaymentSummaryList(
            salesOrgCode: salesOrgCode,
            customerCode: customerCode,
            filter: filter,
            searchKey: searchKey,
            offset: offset,
            pageSize: pageSize,
          );
  }

  Future<Either<ApiFailure, List<PaymentSummaryDetails>>> _getTransactionList({
    required String customerCode,
    required PaymentSummaryFilter filter,
    required SearchKey searchKey,
    required int offset,
    required int pageSize,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final transactions = await localDataSource.getTransactions();

        return Right(transactions);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final transactions = await remoteDataSource.getTransactions(
        requestParams: TransactionParamsDto.fromDomain(
          TransactionParams(
            customerCode: customerCode,
            filter: filter,
            searchKey: searchKey,
            first: pageSize,
            after: offset,
          ),
        ).toMap(),
      );

      return Right(transactions);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  Future<Either<ApiFailure, List<PaymentSummaryDetails>>>
      _getPaymentSummaryList({
    required String salesOrgCode,
    required String customerCode,
    required PaymentSummaryFilter filter,
    required SearchKey searchKey,
    required int offset,
    required int pageSize,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final paymentSummaryDetails = await localDataSource.getPaymentSummary();

        return Right(paymentSummaryDetails);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final filterList = PaymentSummaryFilterDto.fromDomain(filter).toMapList;

      if (searchKey.validateNotEmpty) {
        final searchMap = <String, String>{};
        searchMap.putIfAbsent('field', () => 'zzAdvice');
        searchMap.putIfAbsent('value', () => searchKey.upperCaseValue);
        filterList.add(searchMap);
      }
      final paymentSummaryList = await remoteDataSource.getPaymentSummary(
        customerCode: customerCode,
        salesOrg: salesOrgCode,
        offset: offset,
        filterList: filterList,
        pageSize: pageSize,
      );

      return Right(paymentSummaryList);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}

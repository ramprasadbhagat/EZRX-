import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/repository/i_order_history_repository.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_history_local.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_history_remote.dart';
import 'package:intl/intl.dart';

class OrderHistoryRepository implements IOrderHistoryRepository {
  final Config config;
  final OrderHistoryLocalDataSource localDataSource;
  final OrderHistoryRemoteDataSource orderHistoryRemoteDataSource;

  OrderHistoryRepository({
    required this.config,
    required this.localDataSource,
    required this.orderHistoryRemoteDataSource,
  });

  @override
  Future<Either<ApiFailure, OrderHistory>> getOrderHistory({
    required SalesOrganisationConfigs salesOrgConfig,
    required CustomerCodeInfo soldTo,
    required ShipToInfo shipTo,
    required DateTime fromDate,
    required DateTime toDate,
    required String orderBy,
    required String sort,
    required User user,
    required int pageSize,
    required int offset,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final result = user.role.type.isSalesRep
            ? await localDataSource.getOrderHistoryForSalesRep()
            : await localDataSource.getOrderHistory();

        return Right(result);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }

    try {
      final orderHistoryItemList = user.role.type.isSalesRep
          ? await orderHistoryRemoteDataSource.getOrderHistorySalesRep(
              loginUserType: user.role.type.loginUserType,
              shipTo: shipTo.shipToCustomerCode,
              soldTo: soldTo.customerCodeSoldTo,
              fromDate: DateFormat('yyyyMMdd').format(fromDate),
              toDate: DateFormat('yyyyMMdd').format(toDate),
              pageSize: pageSize,
              offset: offset,
              language: salesOrgConfig.getConfigLangauge,
              userName: user.username.getOrCrash(),
              orderBy: orderBy,
              sort: sort,
            )
          : await orderHistoryRemoteDataSource.getOrderHistory(
              loginUserType: user.role.type.loginUserType,
              shipTo: shipTo.shipToCustomerCode,
              soldTo: soldTo.customerCodeSoldTo,
              fromDate: DateFormat('yyyyMMdd').format(fromDate),
              toDate: DateFormat('yyyyMMdd').format(toDate),
              pageSize: pageSize,
              offset: offset,
              companyName: '',
              orderBy: orderBy,
              sort: sort,
            );

      return Right(orderHistoryItemList);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}

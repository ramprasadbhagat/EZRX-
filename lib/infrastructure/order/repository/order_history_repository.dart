import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_filter.dart';
import 'package:ezrxmobile/domain/order/repository/i_order_history_repository.dart';

import 'package:ezrxmobile/infrastructure/order/datasource/order_history_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_history_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_filter_dto.dart';

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
    required String orderBy,
    required String sort,
    required User user,
    required int pageSize,
    required int offset,
    required OrderHistoryFilter orderHistoryFilter,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final result = user.role.type.isSalesRepRole
            ? await localDataSource.getOrderHistoryForSalesRep()
            : await localDataSource.getOrderHistory();

        return Right(result);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }

    try {
      final orderHistoryItemList = user.role.type.isSalesRepRole
          ? await orderHistoryRemoteDataSource.getOrderHistorySalesRep(
              shipTo: shipTo.shipToCustomerCode,
              soldTo: soldTo.customerCodeSoldTo,
              pageSize: pageSize,
              offset: offset,
              language: salesOrgConfig.getConfigLangauge,
              userName: user.username.getOrCrash(),
              orderBy: orderBy,
              sort: sort,
              filterQuery:
                  OrderHistoryFilterDto.fromDomain(orderHistoryFilter).toJson(),
            )
          : await orderHistoryRemoteDataSource.getOrderHistory(
              shipTo: shipTo.shipToCustomerCode,
              soldTo: soldTo.customerCodeSoldTo,
              pageSize: pageSize,
              offset: offset,
              companyName: '',
              orderBy: orderBy,
              sort: sort,
              filterQuery:
                  OrderHistoryFilterDto.fromDomain(orderHistoryFilter).toJson(),
            );

      return Right(orderHistoryItemList);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}

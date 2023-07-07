import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_header.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_history_filter.dart';
import 'package:ezrxmobile/domain/order/repository/i_view_by_order_repository.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/view_by_order_history_filter_dto.dart';

import 'package:ezrxmobile/domain/core/value/value_objects.dart';

class ViewByOrderRepository implements IViewByOrderRepository {
  final Config config;
  final ViewByOrderLocalDataSource localDataSource;
  final ViewByOrderRemoteDataSource remoteDataSource;

  ViewByOrderRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<ApiFailure, ViewByOrder>> getViewByOrderHistory({
    required SalesOrganisationConfigs salesOrgConfig,
    required CustomerCodeInfo soldTo,
    required ShipToInfo shipTo,
    required User user,
    required int pageSize,
    required int offset,
    required String orderBy,
    required String sort,
    required SearchKey searchKey,
    required List<String> creatingOrderIds,
    required ViewByOrderHistoryFilter viewByOrderHistoryFilter,
    required ViewByOrder viewByOrder,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final result = await localDataSource.getViewByOrderHistory();

        return Right(result);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }

    try {
      final orderHistoryItemList = await remoteDataSource.getViewByOrderHistory(
        shipTo: shipTo.shipToCustomerCode,
        soldTo: soldTo.customerCodeSoldTo,
        pageSize: pageSize,
        offset: offset,
        language: user.preferredLanguage,
        searchKey: searchKey.getOrCrash(),
        orderBy: orderBy,
        creatingOrderIds: creatingOrderIds,
        filterQuery:
            ViewByOrderHistoryFilterDto.fromDomain(viewByOrderHistoryFilter)
                .toJson(),
        sort: sort,
      );

      final newViewByOrderList = List<OrderHistoryDetailsOrderHeader>.from(
        viewByOrder.orderHeaders,
      )..addAll(orderHistoryItemList.orderHeaders);

      return Right(viewByOrder.copyWith(orderHeaders: newViewByOrderList));
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}

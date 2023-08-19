import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_item_filter.dart';
import 'package:ezrxmobile/domain/order/repository/i_view_by_item_repository.dart';
import 'package:ezrxmobile/infrastructure/core/product_image/datasource/product_image_local.dart';
import 'package:ezrxmobile/infrastructure/core/product_image/datasource/product_image_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_item_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_item_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/view_by_item_filter_dto.dart';

class ViewByItemRepository implements IViewByItemRepository {
  final Config config;
  final ViewByItemLocalDataSource localDataSource;
  final OrderHistoryRemoteDataSource orderHistoryRemoteDataSource;
  final ProductImageLocalDataSource productImageLocalDataSource;
  final ProductImageRemoteDataSource productImageRemoteDataSource;

  ViewByItemRepository({
    required this.productImageLocalDataSource,
    required this.productImageRemoteDataSource,
    required this.config,
    required this.localDataSource,
    required this.orderHistoryRemoteDataSource,
  });

  @override
  Future<Either<ApiFailure, OrderHistory>> getViewByItems({
    required SalesOrganisationConfigs salesOrgConfig,
    required CustomerCodeInfo soldTo,
    required ShipToInfo shipTo,
    required User user,
    required int pageSize,
    required int offset,
    required ViewByItemFilter viewByItemFilter,
    required SearchKey searchKey,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final result = user.role.type.isSalesRepRole
            ? await localDataSource.getOrderHistoryForSalesRep()
            : await localDataSource.getViewByItems();

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
              language: user.preferredLanguage.getOrCrash(),
              userName: user.username.getOrCrash(),
              filterQuery:
                  ViewByItemFilterDto.fromDomain(viewByItemFilter)
                      .toJson(),
              query: searchKey.getOrCrash(),
            )
          : await orderHistoryRemoteDataSource.getViewByItems(
              shipTo: shipTo.shipToCustomerCode,
              soldTo: soldTo.customerCodeSoldTo,
              pageSize: pageSize,
              offset: offset,
              language: user.preferredLanguage.getOrCrash(),
              filterQuery:
                  ViewByItemFilterDto.fromDomain(viewByItemFilter)
                      .toJson(),
              searchKey: searchKey.getOrCrash(),
            );

      return Right(orderHistoryItemList);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}

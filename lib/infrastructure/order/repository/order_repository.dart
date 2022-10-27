import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/saved_order.dart';
import 'package:ezrxmobile/domain/order/repository/i_order_repository.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_remote.dart';

class OrderRepository implements IOrderRepository {
  final Config config;
  final OrderLocalDataSource localDataSource;
  final OrderRemoteDataSource remoteDataSource;

  OrderRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<ApiFailure, List<SavedOrder>>> getSavedOrder({
    required User user,
    required SalesOrganisation salesOrg,
    required CustomerCodeInfo customerCode,
    required ShipToInfo shipToCode,
    required int pageSize,
    required int offset,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final savedOrders = await localDataSource.getSavedOrders();

        return Right(savedOrders);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final userId = user.id;
      final salesOrgName = salesOrg.salesOrg.getOrCrash();
      final customerCodeNumber = customerCode.customerCodeSoldTo;
      final shipToCodeNumber = shipToCode.shipToCustomerCode;

      final savedOrders = await remoteDataSource.getSavedOrder(
        userId: userId,
        saleOrgName: salesOrgName,
        shipToCode: shipToCodeNumber,
        customerCode: customerCodeNumber,
        pageSize: pageSize,
        offset: offset,
      );

      return Right(savedOrders);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, List<SavedOrder>>> deleteSavedOrder({
    required SavedOrder orderItem,
    required List<SavedOrder> ordersList,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final newOrdersList = List<SavedOrder>.from(ordersList)
          ..removeWhere((element) => element.id == orderItem.id);

        return Right(newOrdersList);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final deletedOrderItem =
      await remoteDataSource.deleteSavedOrder(itemId: orderItem.id);
      final newOrdersList = List<SavedOrder>.from(ordersList)
        ..removeWhere((element) => element.id == deletedOrderItem.id);

      return Right(newOrdersList);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }
}

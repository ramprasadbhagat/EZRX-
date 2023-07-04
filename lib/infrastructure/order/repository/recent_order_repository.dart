import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/recent_order_item.dart';
import 'package:ezrxmobile/domain/order/repository/i_recent_order_repository.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/recent_orders_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/recent_orders_remote_datasource.dart';

class RecentOrderRepository implements IRecentOrderRepository {
  final Config config;
  final RecentOrdersLocalDataSource localDataSource;
  final RecentOrdersRemoteDataSource remoteDataSource;
  final MaterialListRemoteDataSource materialListRemoteDataSource;

  RecentOrderRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
    required this.materialListRemoteDataSource,
  });

  @override
  Future<Either<ApiFailure, List<RecentOrderItem>>> getRecentlyOrderedProducts({
    required SalesOrganisationConfigs salesOrgConfig,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
  }) async {
    final customerCode = customerCodeInfo.customerCodeSoldTo;
    final shipToCode = shipToInfo.shipToCustomerCode;

    if (config.appFlavor == Flavor.mock) {
      try {
        final productList = await localDataSource.getRecentOrderedProducts();

        return Right(productList);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final productList = await remoteDataSource.getRecentOrderedProducts(
        customerCode: customerCode,
        shipToCode: shipToCode,
        language: salesOrgConfig.getConfigLanguage,
      );

      return Right(productList);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}

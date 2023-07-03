import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';

import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';

import 'package:ezrxmobile/domain/order/repository/i_recent_order_repository.dart';

import 'package:ezrxmobile/infrastructure/order/datasource/recent_orders_local_datasource.dart';

import 'package:ezrxmobile/infrastructure/order/datasource/recent_orders_remote_datasource.dart';

import 'package:ezrxmobile/domain/order/entities/recent_order_item.dart';


import 'package:ezrxmobile/infrastructure/order/datasource/material_list_remote.dart';

import 'package:ezrxmobile/domain/order/value/value_objects.dart';

import 'package:ezrxmobile/domain/order/entities/recent_order_favourite.dart';


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

  @override
  Future<Either<ApiFailure, List<RecentOrderItem>>> addFavouriteProduct({
    required MaterialNumber materialCode,
    required List<RecentOrderItem> productList,
  }) async {
    try {
      await materialListRemoteDataSource.addFavouriteMaterial(
        materialNumber: materialCode.getOrCrash(),
      );
      final newMaterialList = List<RecentOrderItem>.from(productList)
          .map(
            (element) => element.materialNumber == materialCode
                ? element.copyWith(isFavourite: true)
                : element,
          )
          .toList();

      return Right(newMaterialList);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, List<RecentOrderItem>>> deleteFavouriteProduct({
    required MaterialNumber materialCode,
    required List<RecentOrderItem> productList,
  }) async {
    try {
      await materialListRemoteDataSource.removeFavouriteMaterial(
        materialNumber: materialCode.getOrCrash(),
      );
      final newMaterialList = List<RecentOrderItem>.from(productList)
          .map((element) => element.materialNumber == materialCode
              ? element.copyWith(isFavourite: false)
              : element)
          .toList();

      return Right(newMaterialList);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, List<RecentOrderItem>>>
      fetchProductsFavouriteStatus({
    required SalesOrganisationConfigs salesConfigs,
    required List<RecentOrderItem> productList,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        await localDataSource.fetchProductsFavouriteStatus();

        return Right(productList);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final statusObject = <MaterialNumber, bool>{};

      await Future.wait(
        productList.map(
          (e) async {
            final status = await _fetchFavouriteStatus(
              materialCode: e.materialNumber,
              salesOrgConfig: salesConfigs,
            );
            status.fold(
              (failure) {},
              (favouriteStatus) => statusObject.addAll(
                {e.materialNumber: favouriteStatus.isFavourite},
              ),
            );
          },
        ),
      );

      final updatedProductList = productList
          .map(
            (e) => e.copyWith(
              isFavourite: statusObject[e.materialNumber] ?? false,
            ),
          )
          .toList();

      return Right(updatedProductList);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  Future<Either<ApiFailure, RecentOrderFavouriteStatus>> _fetchFavouriteStatus({
    required SalesOrganisationConfigs salesOrgConfig,
    required MaterialNumber materialCode,
  }) async {
    try {
      final status = await remoteDataSource.fetchProductsFavouriteStatus(
        materialNumber: materialCode.getOrCrash(),
        language: salesOrgConfig.getConfigLanguage,
      );

      return Right(status);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}

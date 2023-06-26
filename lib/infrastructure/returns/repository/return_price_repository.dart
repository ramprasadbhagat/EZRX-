import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:dartz/dartz.dart';

import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/usage.dart';

import 'package:ezrxmobile/domain/returns/repository/i_return_price_repository.dart';

import 'package:ezrxmobile/domain/returns/entities/return_price.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';

import 'package:ezrxmobile/infrastructure/returns/datasource/return_price_local.dart';

import 'package:ezrxmobile/infrastructure/returns/datasource/return_price_remote.dart';

import 'package:ezrxmobile/domain/returns/entities/return_item.dart';

import 'package:ezrxmobile/domain/returns/entities/return_item_details.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_item_details_dto.dart';

class ReturnPriceRepository extends IReturnPriceRepository {
  final Config config;
  final ReturnPriceLocalDataSource localDataSource;
  final ReturnPriceRemoteDataSource remoteDataSource;

  ReturnPriceRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<ApiFailure, Map<String, ReturnPrice>>> fetchReturnPrice({
    required SalesOrganisation salesOrg,
    required List<ReturnItem> returnItemsList,
  }) async {
    final salesOrganisation = salesOrg.salesOrg.getOrCrash();
    final returnPriceObject = <String, ReturnPrice>{};
    if (config.appFlavor == Flavor.mock) {
      try {
        return Right(returnPriceObject);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      await Future.wait(returnItemsList.map((e) async {
        final returnPrice = await getPrice(
          returnItem: e,
          salesOrgCode: salesOrganisation,
        );
        returnPrice.fold(
          (failure) {},
          (price) => null,
        );
      }));

      return Right(returnPriceObject);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }

  Future<Either<ApiFailure, ReturnPrice>> getPrice({
    required String salesOrgCode,
    required ReturnItem returnItem,
  }) async {
    try {
      final price = await remoteDataSource.getReturnPrice(
        salesOrg: salesOrgCode,
        invoiceNumber: returnItem.orderNumber,
        materials:
            ReturnItemDetailsDto.fromDomain(_getMaterial(returnItem)).toJson(),
      );

      return Right(price);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  ReturnItemDetails _getMaterial(ReturnItem returnItem) =>
      ReturnItemDetails.empty().copyWith(
        batch: returnItem.batch,
        itemNumber: returnItem.orderNumber,
        materialNumber: returnItem.materialNumber,
        returnQuantity: ReturnQuantity(returnItem.itemQty.toString()),
        usage: Usage.empty(),
      );
}

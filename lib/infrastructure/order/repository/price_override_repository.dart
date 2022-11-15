import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/repository/i_price_override_repository.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/price_override/price_override_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/price_override/price_override_remote.dart';

import 'package:ezrxmobile/domain/order/entities/price.dart';

class PriceOverrideRepository implements IPriceOverrideRepository {
  final Config config;
  final PriceOverrideLocalDataSource localDataSource;
  final PriceOverrideRemoteDataSource remoteDataSource;

  PriceOverrideRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
  });
  @override
  Future<Either<ApiFailure, List<Price>>> updateItemPrice({
    required PriceAggregate item,
    required String newPrice,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final price = await localDataSource.getOverridePrice();

        return Right(
          price,
        );
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }

    try {
      final price = await remoteDataSource.getOverridePrice(
        price: newPrice,
        custCode: customerCodeInfo.customerCodeSoldTo,
        materialNumber: item.materialInfo.materialNumber.getOrCrash(),
        salesOrg: salesOrganisation.salesOrg.getOrCrash(),
      );

      return Right(price);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}

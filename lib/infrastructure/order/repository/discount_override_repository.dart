import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/repository/i_discount_override_repository.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/discount_override_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/discount_override_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_dto.dart';

import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';

class DiscountOverrideRepository implements IDiscountOverrideRepository {
  final Config config;
  final DiscountOverrideLocalDataSource localDataSource;
  final DiscountOverrideRemoteDataSource remoteDataSource;

  DiscountOverrideRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<ApiFailure, Price>> getMaterialPriceWithOverride({
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required Price price,
    required ShipToInfo shipToInfo,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final priceData = await localDataSource.getPriceList();

        return price.zdp8Override.isValid()
            ? Right(
                priceData.first.copyWith(materialNumber: price.materialNumber),
              )
            : Right(
                priceData
                    .firstWhere(
                      (element) =>
                          element.materialNumber == price.materialNumber,
                      orElse: () => priceData.first,
                    )
                    .copyWith(materialNumber: price.materialNumber),
              );
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final salesOrgCode = salesOrganisation.salesOrg.getOrCrash();
      final customerCode = customerCodeInfo.customerCodeSoldTo;
      final shipToCode = shipToInfo.shipToCustomerCode;

      final priceData = await remoteDataSource.getMaterialOverridePriceList(
        salesOrgCode: salesOrgCode,
        customerCode: customerCode,
        materialQuery: PriceDto.fromDomain(price).overrideQuery,
        shipToCode: shipToCode,
      );

      return Right(priceData.first);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}

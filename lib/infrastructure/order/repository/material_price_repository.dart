import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/repository/i_material_price_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_remote.dart';

class MaterialPriceRepository implements IMaterialPriceRepository {
  final Config config;
  final MaterialPriceLocalDataSource localDataSource;
  final MaterialPriceRemoteDataSource remoteDataSource;

  MaterialPriceRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<ApiFailure, Map<MaterialNumber, Price>>> getMaterialPrice({
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesConfigs,
    required ShipToInfo shipToInfo,
    required List<MaterialNumber> materialNumberList,
    required bool comboDealEligible,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final priceData = await localDataSource.getPriceList();

        return Right(
          {
            for (var price in priceData) price.materialNumber: price,
          },
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
      final queryMaterialNumbers =
          materialNumberList.map((e) => e.getOrCrash()).toList();

      final queryComboDeals = comboDealEligible
          ? customerCodeInfo.salesDeals.map((e) => e.getOrCrash()).toList()
          : <String>[];

      final priceData = await remoteDataSource.getMaterialList(
        salesOrgCode: salesOrgCode,
        customerCode: customerCode,
        materialNumbers: queryMaterialNumbers,
        shipToCode: shipToCode,
        salesDeal: queryComboDeals,
      );

      return Right(
        {
          for (var price in priceData) price.materialNumber: price,
        },
      );
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}

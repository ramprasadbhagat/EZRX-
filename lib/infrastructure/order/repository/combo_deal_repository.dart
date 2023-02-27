import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/price_combo_deal.dart';
import 'package:ezrxmobile/domain/order/repository/i_combo_deal_repository.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/combo_deal_remote.dart';

class ComboDealRepository implements IComboDealRepository {
  final Config config;
  final ComboDealRemoteDataSource remoteDataSource;

  ComboDealRepository({
    required this.config,
    required this.remoteDataSource,
  });

  @override
  Future<Either<ApiFailure, List<ComboDeal>>> getComboDealList({
    required SalesOrg salesOrg,
    required CustomerCodeInfo customerCode,
    required PriceComboDeal comboDealInfo,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        //TODO: Implement local data source
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final comboDeals = await remoteDataSource.getComboDealList(
        customerCode: customerCode.customerCodeSoldTo,
        flexibleGroup: comboDealInfo.flexibleGroup.getOrCrash(),
        materialNumbers: comboDealInfo.category.comboMaterialNumbers
            .map((e) => e.getOrCrash())
            .toList(),
        salesDeal: comboDealInfo.salesDeal.getOrCrash(),
        salesOrgCode: salesOrg.getOrCrash(),
      );

      return Right(comboDeals);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}

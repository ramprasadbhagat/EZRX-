import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';

import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';

import 'package:ezrxmobile/domain/order/entities/recent_order_item.dart';

import 'package:ezrxmobile/domain/order/value/value_objects.dart';

abstract class IRecentOrderRepository {
  Future<Either<ApiFailure, List<RecentOrderItem>>> getRecentlyOrderedProducts({
    required SalesOrganisationConfigs salesOrgConfig,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
  });

  Future<Either<ApiFailure, List<RecentOrderItem>>> addFavouriteProduct({
    required MaterialNumber materialCode,
    required List<RecentOrderItem> productList,
  });

  Future<Either<ApiFailure, List<RecentOrderItem>>> deleteFavouriteProduct({
    required MaterialNumber materialCode,
    required List<RecentOrderItem> productList,
  });

  Future<Either<ApiFailure, List<RecentOrderItem>>>
      fetchProductsFavouriteStatus({
    required SalesOrganisationConfigs salesConfigs,
    required List<RecentOrderItem> productList,
  });
}
